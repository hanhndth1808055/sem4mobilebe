const express = require("express");
const router = express.Router();
const createStudent = require("../../connect-db/students/select");

//service
const converterObjectToRecord = require("../../service/converter-object-to-record");
// model
const response = require("../../model/response");

// router.use

router.post('/', (req, res) => {
    let information = req.body;
// console.log(information);
    let converted = converterObjectToRecord.converter(information);
    console.log(converted);
    createStudent.create(converted.schema, converted.record).then(async result => {
        if(result.affectedRows === 1) {
            try {
                let condition = "id=" + result.insertId;
                let newStudent = await createStudent.select(condition);
                return res.json(response(200, 'Successfully create a student record', newStudent));
            } catch (error) {
                console.log(error);
                return res.json(response(200, 'Successfully create a student record', []));
            }
        }
    });

})

module.exports = router;