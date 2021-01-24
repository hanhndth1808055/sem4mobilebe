// "use strict";
// Object.defineProperty(exports, "__esModule", { value: true });
const fileHelpers = require("./fileHelpers");
const faceHelpers = require("./faceHelpers");
const updateStudent = require("../connect-db/students/select");
const updateCheckInRecords = require("../connect-db/check_in_records/select");
const checkExistStudent = require("../connect-db/students/select");
const response = require("../model/response");
const activeMQService = require("./activemq-service");


var Stomp = require('stomp-client');
var http = require('http');
var request = require('request');
var destination = '/queue/someQueueName';
var express = require('express');
var app = express();

async function detectFaceWithAttributes(inputImgPath) {
    await faceHelpers.detectFaceWithAttributes(inputImgPath)
        .then(results => {
            console.log(results);
        });
}

// const personGroupId = 'myfriends';

// Step 1: create personGroup here
async function createPersonGroup(personGroupId, fatherDirectory) {
    if (!fatherDirectory || fatherDirectory == '') fatherDirectory = 'Data\\' + personGroupId;
    return await faceHelpers.createPersonGroup(personGroupId).then(async result => {
        if (result === personGroupId) {
            console.log('person group created');
            const friends = fileHelpers.getFriends(fatherDirectory);
            // console.log(friends);
            let personGroupArr = [];
            personGroupArr['personGroupId'] = personGroupId;
            personGroupArr['people'] = [];
            return await friends.forEach(async friend => {
                // console.log(friend);
                let checkResult = await checkExistStudent.checkExist(friend);
                let checkExist = await checkExistStudent.checkExistWithPersonID(friend);
                console.log("-------------------------------------");
                if (JSON.stringify(checkResult) == "[]") {
                    console.log("No Student ID found");
                    return false;
                } else if(JSON.stringify(checkExist) == "[]") {
                    personGroupArr['people'][friend] = [];
                    return await faceHelpers.createPerson(personGroupId, friend).then(async result => {
                        // console.log(result);
                        console.log("Result PersonId:");
                        let personIdString = JSON.parse(result).personId;
                        // Update PersonId to local DB
                       await updatePersonId(friend, personIdString);
                        // create Array result
                        personGroupArr['people'][friend]['personId'] = JSON.parse(result).personId;
                        personGroupArr['people'][friend]['faceIds'] = [];
                        const personId = result;
                        let faceIdArr = [];
                        console.log(`Created personId: ${result} for person: ${friend}`);
                        const friendPictures = fileHelpers.getFriendPictures(fatherDirectory, friend);
                        return await friendPictures.forEach(async friendPicture => {
                            const friendFaceFileName = __dirname + '/' + fatherDirectory + '/' + friend + '/' + friendPicture;
                            return await faceHelpers.addPersonFace(friendFaceFileName, personId, personGroupId).then(async result => {
                                personGroupArr['people'][friend]['faceIds'].push(result);
                                console.log(`For personId: ${result} person: ${friend} added face: ${friendPicture} got persistedFaceId: ${result}`);
                                faceIdArr.concat(result);
                                // console.log(personGroupArr);
    
                                return result;
                            });
                        });
                    });
                } else {
                    console.log("Student already has face registration!");
                    return false;
                }
            });
        }
    });
}
// // Step 2: Train person group
async function trainPersonGroup(personGroupId) {
    return await faceHelpers.trainPersonGroup(personGroupId).then(result => {
        if (result) {
            console.log('personGroup trained');
            return "Trained OKKKK";
        }
    });
}
// // Step 3: Detecting and identifying a person
async function detectFace(personGroupId, inputImgPath) {
    console.log("detectFace");
    return await faceHelpers.detectFace(inputImgPath).then(faceId => {
        return faceHelpers.identifyPerson(personGroupId, faceId).then(async result => {
            // console.log('Input recognized as: ' + result + 'FaceID: '+ faceId);
            // console.log(result);
            if (JSON.parse(result) && JSON.parse(result)[0] && JSON.parse(result)[0].candidates[0]) {
                let personId = JSON.parse(result)[0].candidates[0].personId;
                let student = await updateStudent.select("person_id = " + "'" + personId + "'");
                if(student && student[0]) {
                    student = JSON.parse(JSON.stringify(student));
                    // console.log(student[0].id);
                    let notYetCheckIn = await updateCheckInRecords.notYetCheckIn(student[0].id);
                    if(notYetCheckIn) {
                        return await updateCheckInRecords.create("student_id, status", "'" + student[0].id + "', 1").then(async res => {
                            // console.log(res);
                            let record = await updateCheckInRecords.select("id = " + JSON.parse(JSON.stringify(res)).insertId);
                            // console.log(JSON.stringify(record));
                            await sendCheckInRecordToActiveMQ(record);
                            return response(200, "Checked in Successfully!", {
                                id: student[0].id,
                                check_in_records: res
                            });
                        }).catch(err => {
                            console.log(err);
                            return response(400, "Checked in Unsuccessfully!", {
                                id: student[0].id,
                                check_in_records: err
                            });
                        });
                    } else {
                        let checkedInAlready = await updateCheckInRecords.checkedInAlready(student[0].id);
                        if(checkedInAlready) {
                            return await updateCheckInRecords.create("student_id, status", "'" + student[0].id + "', 2").then(async res => {
                                console.log(res);
                                let record = await updateCheckInRecords.select("id = " + JSON.parse(JSON.stringify(res)).insertId);
                                // console.log(JSON.stringify(record));
                                await sendCheckInRecordToActiveMQ(record);
                                return response(200, "Checked out Successfully!", {
                                    id: student[0].id,
                                    check_in_records: res
                                });
                            }).catch(err => {
                                console.log(err);
                                return response(400, "Checked out Unsuccessfully!", {
                                    id: student[0].id,
                                    check_in_records: err
                                });
                            });
                        } else {
                            console.log("It's not over 5 mins from last logged in");
                            return response(200, "Checked in Already! Not more than 5 mins!", {
                                id: student[0].id
                            });
                        }
                    }
                }
            } else {
                return response(400, "Checked in Unsuccessfully!", {
                    id: "",
                    check_in_records: "Errors - Face not found!"
                });
            }
        });
    });
}

// Step 4: Delete the group
async function deletePersonGroup(personGroupId) {
    await faceHelpers.deletePersonGroup(personGroupId).then(result => {
        if (result)
            console.log('person group deleted');
        else
            console.log('error deleting the group');
    });

}

async function showAllPersonGroup() {
    return await faceHelpers.showAllPersonGroup().then(result => {
        if (result == "[]") {
            console.log('No available person group');
            return result;
        } else if (result.length > 2) {
            console.log('Person group exist');
            return result;
        } else {
            console.log('Error');
            return result;
        }
    });
}

async function showAPersonGroup(personGroupId) {
    return await faceHelpers.showAPersonGroup(personGroupId).then(result => {
        let response = JSON.parse(result);
        if (response.personGroupId && response.personGroupId == personGroupId) {
            console.log('Group exists!');
            return true;
        } else if (response.errors) {
            console.log('Error');
            return false;
        } else {
            console.log('Error');
            return false;
        }
    });
}


async function createSinglePerson(personGroupId, friend, fatherDirectory) {
    if (!fatherDirectory || fatherDirectory == '') fatherDirectory = 'Data';
    let personGroupArr = [];
    personGroupArr['personGroupId'] = personGroupId;
    personGroupArr['people'] = [];
    personGroupArr['people'][friend] = [];
    return await faceHelpers.createPerson(personGroupId, friend).then(async result => {
        // console.log("Result PersonId:");
        // console.log(result);
        personGroupArr['people'][friend]['personId'] = result;
        personGroupArr['people'][friend]['faceIds'] = [];
        const personId = result;
        let faceIdArr = [];
        console.log(`Created personId: ${result} for person: ${friend}`);
        const friendPictures = fileHelpers.getFriendPictures(fatherDirectory, friend);
        return await friendPictures.forEach(async friendPicture => {
            const friendFaceFileName = __dirname + '/' + fatherDirectory + '/' + friend + '/' + friendPicture;
            return await faceHelpers.addPersonFace(friendFaceFileName, personId, personGroupId).then(async result => {
                personGroupArr['people'][friend]['faceIds'].push(result);
                console.log(`For personId: ${result} person: ${friend} added face: ${friendPicture} got persistedFaceId: ${result}`);
                faceIdArr.concat(result);
                console.log(personGroupArr);
                return result;
            });
        });
    });
}

async function updatePersonId(studentId, personId) {
    let checkResult = await checkExistStudent.checkExist(studentId);
    // console.log("StudentId: "+ studentId);
    // console.log(checkResult);
    // console.log("1");
    await updateStudent.update("'" + studentId + "'", "person_id = " + "'" + personId + "'").then(result => {
        // console.log(result);
        // console.log("2");
        if (result.affectedRows && result.affectedRows == 1) {
            return response(200, "Update Successfully!", {
                id: studentId
            });
        }
    }).catch(err => {
        console.log(err);
        return response(500, "Errors", [err]);
    });
}
async function sendCheckInRecordToActiveMQ(contentToSend) {
    let object = JSON.parse(JSON.stringify(contentToSend));
    console.log(JSON.parse(JSON.stringify(contentToSend)));
    activeMQService.main(object);
}

module.exports = {
    detectFaceWithAttributes: detectFaceWithAttributes,
    createPersonGroup: createPersonGroup,
    trainPersonGroup: trainPersonGroup,
    detectFace: detectFace,
    deletePersonGroup: deletePersonGroup,
    showAllPersonGroup: showAllPersonGroup,
    createSinglePerson: createSinglePerson,
    showAPersonGroup: showAPersonGroup
}