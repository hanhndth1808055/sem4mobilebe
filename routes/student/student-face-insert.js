const express = require("express");
const router = express.Router();
const updateStudent = require("../../connect-db/students/select");

//service
const converterObjectToRecord = require("../../service/converter-object-to-record");
//model
const response = require("../../model/response");

//route.use

router.post('/', (req, res) => {
    let information = req.body;

    let id = req.params.id;
    
    let converted = converterObjectToRecord.convertForUpdate(information);
    return res.json(response(200, "Connected!!", {
        id: id,
        information: information
    }));
    // updateStudent.update("'"+id+"'", converted).then(result => {
    //     // console.log(result);
    //     if(result.affectedRows && result.affectedRows == 1) {
    //         return res.json(response(200, "Update Successfully!", {
    //             id: id
    //         }));
    //     }
    // }).catch(err => {
    //     return res.json(response(500, "Errors", [err]));
    // });
})

module.exports = router;