"use strict";
// Object.defineProperty(exports, "__esModule", { value: true });
const fileHelpers = require("./fileHelpers");
const faceHelpers = require("./FaceHelpers");

function detectFaceWithAttributes(inputImgPath) {
    faceHelpers.detectFaceWithAttributes(inputImgPath)
    .then(results => {
    console.log(results);
});
}

// const personGroupId = 'myfriends';

// Step 1: create personGroup here
function createPersonGroup(personGroupId) {
    faceHelpers.createPersonGroup(personGroupId).then(result => {
        if (result === personGroupId) {
            console.log('person group created');
            const friends = fileHelpers.getFriends('Data');
            friends.forEach(friend => {
                faceHelpers.createPerson(personGroupId, friend).then(result => {
                    const personId = result;
                    console.log(`Created personId: ${result} for person: ${friend}`);
                    const friendPictures = fileHelpers.getFriendPictures(friend);
                    friendPictures.forEach(friendPicture => {
                        const friendFaceFileName = __dirname + '/Data/' + friend + '/' + friendPicture;
                        faceHelpers.addPersonFace(friendFaceFileName, personId, personGroupId).then(result => {
                            console.log(`For personId: ${result} person: ${friend} added face: ${friendPicture} got persistedFaceId: ${result}`);
                        });
                    });
                });
            });
        }
    });
}
// // Step 2: Train person group
function trainPersonGroup(personGroupId) {
    faceHelpers.trainPersonGroup(personGroupId).then(result => {
        if (result)
            console.log('personGroup trained');
    });
}
// // Step 3: Detecting and identifying a person
function detectFace(personGroupId, inputImgPath) {
    faceHelpers.detectFace(inputImgPath).then(faceId => {
        faceHelpers.identifyPerson(personGroupId, faceId).then(result => {
            console.log('Input recognized as: ' + result);
        });
    });
}

// Step 4: Delete the group
function deletePersonGroup(personGroupId) {
    faceHelpers.deletePersonGroup(personGroupId).then(result => {
        if (result)
            console.log('person group deleted');
        else
            console.log('error deleting theg group');
    });
    
}

function showAllPersonGroup() {
    faceHelpers.showAllPersonGroup().then(result => {
        if (result == [])
        console.log('No available person group');
    else if (result.length > 0)
        console.log('Person group exist');
        else 
        console.log('Error');

        return result;
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