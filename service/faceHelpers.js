"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const request = require("request");
const config_1 = require("./config");
const querystring = require("querystring");
const fileHelpers = require("./fileHelpers");
const timers_1 = require("timers");
// Creates a person group and returns personGroupId
function createPersonGroup(personGroupId) {
    const promise = new Promise((resolve, reject) => {
        const requestOptions = getRequestOptions();
        requestOptions.headers['Content-Type'] = 'application/json';
        requestOptions.body = JSON.stringify({
            'name': personGroupId
        });
        request.put(config_1.config.face.endPoint + '/persongroups/' + personGroupId, requestOptions, (err, response, body) => {
            if (err) {
                reject(false);
            }
            else {
                resolve(personGroupId);
            }
        });
    });
    return promise;
}
exports.createPersonGroup = createPersonGroup;
function deletePersonGroup(personGroupId) {
    const promise = new Promise((resolve, reject) => {
        const requestOptions = getRequestOptions();
        requestOptions.headers['Content-Type'] = 'application/json';
        request.delete(config_1.config.face.endPoint + '/persongroups' + personGroupId, requestOptions, (err, response, body) => {
            if (err) {
                reject(false);
            }
            else {
                resolve(true);
            }
        });
    });
    return promise;
}
exports.deletePersonGroup = deletePersonGroup;
function trainPersonGroup(personGroupId) {
    const promise = new Promise((resolve, reject) => {
        const requestOptions = getRequestOptions();
        requestOptions.headers['Content-Type'] = 'application/json';
        request.post(config_1.config.face.endPoint + '/persongroups/' + personGroupId + '/train', requestOptions, (err, response, body) => {
            if (err) {
                reject(false);
            }
            else {
                const interval = timers_1.setInterval(() => {
                    request.get(config_1.config.face.endPoint + '/persongroups/' + personGroupId + '/training', requestOptions, (err, response, body) => {
                        if (JSON.parse(body).status) {
                            timers_1.clearInterval(interval);
                            resolve(true);
                        }
                        else {
                            console.log('Not trained:');
                            console.log(body);
                        }
                    });
                }, 1000);
            }
        });
    });
    return promise;
}
exports.trainPersonGroup = trainPersonGroup;
function createPerson(personGroupId, personName) {
    const promise = new Promise((resolve, reject) => {
        const requestOptions = getRequestOptions();
        requestOptions.headers['Content-Type'] = 'application/json';
        requestOptions.body = JSON.stringify({
            'name': personName
        });
        request.post(config_1.config.face.endPoint + '/persongroups/' + personGroupId + '/persons', requestOptions, (err, response, body) => {
            if (err) {
                reject(false);
            }
            else {
                resolve(body);
            }
        });
    });
    return promise;
}
exports.createPerson = createPerson;
function addPersonFace(personFile, personId, personGroupId) {
    personId = JSON.parse(personId).personId;
    const promise = new Promise((resolve, reject) => {
        const requestOptions = getRequestOptions();
        requestOptions.body = fileHelpers.readImage(personFile);
        const uri = config_1.config.face.endPoint + '/persongroups/' + personGroupId +
            '/persons/' + personId + '/persistedFaces';
        request.post(uri, requestOptions, (err, response, body) => {
            if (err) {
                reject(false);
            }
            else {
                resolve(body);
            }
        });
    });
    return promise;
}
exports.addPersonFace = addPersonFace;
// returns faceID
function detectFace(fileName) {
    const promise = new Promise((resolve, reject) => {
        const requestOptions = getRequestOptions();
        requestOptions.body = fileHelpers.readImage(__dirname + "/" + fileName);
        const params = {
            "returnFaceId": "true",
            "returnFaceLandmarks": "false"
        };
        const uri = config_1.config.face.endPoint + "/detect?" + querystring.stringify(params);
        request.post(uri, requestOptions, (err, response, body) => {
            resolve(JSON.parse(body)[0].faceId);
        });
    });
    return promise;
}
exports.detectFace = detectFace;
function identifyPerson(personGroupId, faceId) {
    const promise = new Promise((resolve, reject) => {
        const requestOptions = getRequestOptions();
        requestOptions.headers['Content-Type'] = 'application/json';
        requestOptions.body = JSON.stringify({
            'personGroupId': personGroupId,
            "faceIds": [
                faceId
            ],
            "maxNumOfCandidatesReturned": 1,
            "confidenceThreshold": 0.5
        });
        request.post(config_1.config.face.endPoint + '/identify', requestOptions, (err, response, body) => {
            if (err) {
                reject(false);
            }
            else {
                resolve(body);
            }
        });
    });
    return promise;
}
exports.identifyPerson = identifyPerson;
function detectFaceWithAttributes(fileName) {
    const promise = new Promise((resolve, reject) => {
        const requestOptions = getRequestOptions();
        let attributes = "age,gender,headPose,smile," +
            "facialHair,glasses,emotion," +
            "hair,makeup,occlusion,accessories," +
            "blur,exposure,noise";
        requestOptions.body = fileHelpers.readImage(__dirname + "/" + fileName);
        const params = {
            "returnFaceId": "true",
            "returnFaceLandmarks": "true",
            "returnFaceAttributes": attributes
        };
        const uri = config_1.config.face.endPoint + "/detect?" + querystring.stringify(params);
        request.post(uri, requestOptions, (err, response, body) => {
            resolve(body);
        });
    });
    return promise;
}
exports.detectFaceWithAttributes = detectFaceWithAttributes;

// Show All Person Group
function showAllPersonGroup() {
    const promise = new Promise((resolve, reject) => {
        const requestOptions = getRequestOptions();
        // requestOptions.body = fileHelpers.readImage(personFile);
        const uri = config_1.config.face.endPoint + '/persongroups?start=&top=1000&returnRecognitionModel=false';
        request.get(uri, requestOptions, (err, response, body) => {
            if (err) {
                reject(false);
            }
            else {
                resolve(body);
            }
        });
    });
    return promise;
}
exports.showAllPersonGroup = showAllPersonGroup;
function getRequestOptions() {
    return {
        headers: {
            "Content-Type": "application/octet-stream",
            "Ocp-Apim-Subscription-Key": config_1.config.face.key1
        }
    };
}
