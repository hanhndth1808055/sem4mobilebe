const express = require("express");
const router = express.Router();
const updateStudent = require("../../connect-db/students/select");
const fileHelpers = require("../../service/fileHelpers");
const faceAiService = require("../../service/face-ai-service");
//service
const converterObjectToRecord = require("../../service/converter-object-to-record");
//model
const response = require("../../model/response");

//route.use

router.post('/:id', async (req, res) => {
    let information = req.body;
    let images = await JSON.parse(JSON.stringify(req.files.file));

    let id = req.params.id;
    for (const file of req.files.file) {
        await fileHelpers.setFriendPictures("Data", id, file);
    }
    await faceAiService.createSinglePerson("car1", id, "Data");
    await faceAiService.trainPersonGroup("car1");
    
    return information;
    // let converted = converterObjectToRecord.convertForUpdate(information);

    // updateStudent.update("'"+id+"'", converted).then(result => {
    //     if(result.affectedRows && result.affectedRows == 1) {
    //         return res.json(response(200, "Update Successfully!", {
    //             id: id
    //         }));
    //     }
    // }).catch(err => {
    //     return res.json(response(500, "Errors", [err]));
    // });
});

module.exports = router;