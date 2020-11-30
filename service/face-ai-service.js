// "use strict";
// Object.defineProperty(exports, "__esModule", { value: true });
const fileHelpers = require("./fileHelpers");
const faceHelpers = require("./FaceHelpers");

async function detectFaceWithAttributes(inputImgPath) {
    await faceHelpers.detectFaceWithAttributes(inputImgPath)
        .then(results => {
            console.log(results);
        });
}

// const personGroupId = 'myfriends';

// Step 1: create personGroup here
async function createPersonGroup(personGroupId, fatherDirectory) {
    if(!fatherDirectory || fatherDirectory == '') fatherDirectory = 'Data';
    return await faceHelpers.createPersonGroup(personGroupId).then(async result => {
        if (result === personGroupId) {
            console.log('person group created');
            const friends = fileHelpers.getFriends(fatherDirectory);
            let personGroupArr = [];
            personGroupArr['personGroupId'] = personGroupId;
            personGroupArr['people'] = [];
            await friends.forEach(async friend => {
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
                    return await friendPictures.xforEach(async friendPicture => {
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
    await faceHelpers.detectFace(inputImgPath).then(faceId => {
        faceHelpers.identifyPerson(personGroupId, faceId).then(result => {
            console.log('Input recognized as: ' + result);
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
        } else if (result.length > 2){
            console.log('Person group exist');
            return result;
        }else{
            console.log('Error');
            return result;
        }
    });
}

module.exports = {
    detectFaceWithAttributes: detectFaceWithAttributes,
    createPersonGroup: createPersonGroup,
    trainPersonGroup: trainPersonGroup,
    detectFace: detectFace,
    deletePersonGroup: deletePersonGroup,
    showAllPersonGroup: showAllPersonGroup
}