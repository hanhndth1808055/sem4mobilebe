const stompit = require('stompit');
const createStudent = require("./../connect-db/students/select");

//service
const converterObjectToRecord = require("./converter-object-to-record");

let main = async () => {
    stompit.connect({
        host: '139.162.7.248',
        port: 61613
    }, async function (error, client) {
        const subscribeHeaders = {
            'destination': '/queue/update_student',
            'ack': 'client-individual'
        };

        await client.subscribe(subscribeHeaders, async function (error, message) {

            if (error) {
                console.log('subscribe error ' + error.message);
                return;
            }

            await message.readString('utf-8', async function (error, body) {

                if (error) {
                    console.log('read message error ' + error.message);
                    return;
                }


                // console.log('received message: ' + body);
                // console.log(JSON.parse(body));

                await synchronizeStudentPI(JSON.parse(body));
                
                client.ack(message);

                // client.disconnect();
            });
        });
    });
}

async function synchronizeStudentPI(information) {
    console.log(typeof information);
    information.is_active = information.is_active.data[0];
    delete information.start_date;
    delete information.images;
    let converted = converterObjectToRecord.converter(information);
    // console.log(converted);
    createStudent.create(converted.schema, converted.record).then(async result => {
        // console.log(result);
        if(result && result.affectedRows === 1) {
            try {
                let condition = "id=" + result.insertId;
                let newStudent = await createStudent.select(condition);
                console.log("Student Record With PersonID added successfully!");
                return newStudent;
            } catch (error) {
                console.log(error);
                return null;
            }
        } else {
            
            console.log("Student Record With PersonID added unsuccessfully!");
            return null;
        }
    });
}
// module.exports = {
//     main: main
// }

main();