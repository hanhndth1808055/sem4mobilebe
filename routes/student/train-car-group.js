const express = require("express");
const router = express.Router();
const createStudent = require("../../connect-db/students/select");
const faceService = require('../../service/face-ai-service');

//service
const converterObjectToRecord = require("../../service/converter-object-to-record");
// model
const response = require("../../model/response");

// router.use

router.post('/', async (req, res) => {
    let information = req.body;
    let group = information.group;
    await trainGroup(group).then(async result => {
        return res.json(result);
    });
    // console.log(information);
    let converted = converterObjectToRecord.converter(information);
    // console.log(converted);
    // createStudent.create(converted.schema, converted.record).then(async result => {
    //     if(result.affectedRows === 1) {
    //         try {
    //             let condition = "id=" + result.insertId;
    //             let newStudent = await createStudent.select(condition);
    //             return res.json(response(200, 'Successfully create a student record', newStudent));
    //         } catch (error) {
    //             console.log(error);
    //             return res.json(response(200, 'Successfully create a student record', []));
    //         }
    //     }
    // });

});

async function trainGroup(groupName) {
    let personGroups = await faceService.showAPersonGroup(groupName);
    // console.log(personGroups);
    if (personGroups == false) {
        await faceService.createPersonGroup(groupName).then(res => {
            // console.log("ABCCCC");
            console.log(res);
        }).catch(err => {
            return response(403, 'Errors occurred while creating a person group', err);
        });
    } else {
        await faceService.trainPersonGroup(groupName).then(res => {
            return response(200, 'Training person group finished');
        }).catch(err => {
            return response(403, 'Errors occurred while training the group', err);
        });
    }
}

module.exports = router;