const express = require("express");
const router = express.Router();

// model
const response = require("../../model/response");

const faceService = require('../../service/face-ai-service');

router.post('/', async (req, res) => {
    let information = req.body;
    let group = information.group;
    let image = information.image;
    await faceRecognize(group, image).then(async result => {
        // console.log(result);
        return res.json(result);
    });
});

async function faceRecognize(groupName, imageName) {
    if(!imageName) {
        imageName = "IMG_20200708_110428.jpg";
    }
    await faceService.trainPersonGroup(groupName).then(res => console.log(res));
    return await faceService.detectFace(groupName, "./"+imageName).then(result => {
        // console.log(result);
        return result;
    });
}

module.exports = router;