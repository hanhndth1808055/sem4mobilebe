// const dbtest = require("./connect-db/students/select.js");

const faceService = require('./service/face-ai-service');

if(faceService.showAllPersonGroup == []) {
    faceService.createPersonGroup("car1");
}