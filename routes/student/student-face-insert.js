const express = require("express");

const router = express.Router();
const updateStudent = require("../../connect-db/students/select");
const fs = require('fs-extra');
const fetch = require('node-fetch');
const request = require('request');
const path = require('path');

const faceService = require('./../../service/face-ai-service');

const download = (url, path, callback) => {
    request.head(url, (err, res, body) => {
        console.log(url);
        request(url)
            .pipe(fs.createWriteStream(path))
            .on('close', callback)
    })
}
//service
const converterObjectToRecord = require("../../service/converter-object-to-record");
//model
const response = require("../../model/response");

var fileList = [];

router.post('/', async (req, res) => {
    let information = req.body;
    console.log(information);
    if (information && information.length > 0) {
        for (const item of information) {
            let carid = item.group.replace(/[^a-z0-9]/gi, '').toLowerCase();
            let pathItem = path.join(__dirname, "./../../service/Data/") + carid + "\\"+item.student_id;
            console.log(pathItem);
            await fs.ensureDir(pathItem);
            if (item.pictures && item.pictures.length > 0) {
                for (const picture of item.pictures) {
                    // console.log(picture);
                    // console.log(pathItem + "\\" + getFileName(picture));
                    fileList.push(pathItem + "\\" + getFileName(picture));
                    await download(picture, pathItem + "\\" + getFileName(picture), () => {
                        console.log('✅ Done!')
                    });
                }
            }
            await trainPersonGroup(carid);
        }
    }
    return res.json(response(200, "Connected!!", {
        information: information
    }));
})

var getFileName = function (str) {
    return str.split('\\').pop().split('/').pop();
}

const trainPersonGroup = async (groupName) => {
    // console.log(groupName);
    let personGroups = await faceService.showAllPersonGroup();
    // console.log(personGroups == "[]");
    if(personGroups  == "[]") {
        // console.log("OKKKk");
        await faceService.createPersonGroup(groupName).then(res => console.log(res));
        await faceService.trainPersonGroup(groupName).then(res => console.log(res));
    } else {
        // for (const item of JSON.parse(personGroups)) {
            await faceService.createPersonGroup(groupName).then(res => console.log(res));
            await faceService.trainPersonGroup(groupName).then(res => console.log(res));
        // }
    }

    for (const file of fileList) {
        await fs.remove(file);
    }
}

module.exports = router;