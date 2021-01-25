const stompit = require('stompit');

let main = (studentRecord) => {
    stompit.connect({
        host: '139.162.7.248',
        port: 61613
    }, function (error, client) {
        const sendHeaders = {
            'destination': '/queue/update_student',
            'content-type': 'application/json',
            login: 'admin',
            passcode: 'Password@123'
        };
        console.log(studentRecord);
        // for (const item of checkInArr) {
        //     delete item.sent_to_main_server;
        // }
        const contentToSend = JSON.stringify(studentRecord);

        const frame = client.send(sendHeaders);
        frame.write(contentToSend);
        frame.end();

        // const subscribeHeaders = {
        //     'destination': '/queue/def',
        //     'ack': 'client-individual'
        // };

        // client.subscribe(subscribeHeaders, function (error, message) {

        //     if (error) {
        //         console.log('subscribe error ' + error.message);
        //         return;
        //     }

        //     message.readString('utf-8', function (error, body) {

        //         if (error) {
        //             console.log('read message error ' + error.message);
        //             return;
        //         }

        //         console.log('received message: ' + body);

        //         client.ack(message);

        //         client.disconnect();
        //     });
        // });
    });
}

module.exports = {
    main: main
}

// main({
//     id: 38,
//     address: "Mà cũng xa",
//     car_id: "20B-aa1",
//     class_id: 1,
//     date_of_birth: "2001-01-02 05:00:00",
//     full_name: "Trần Văn C",
//     is_active: 1,
//     parents_id: 50,
//     school_id: 1,
//     person_id: "ABCDE"
// });