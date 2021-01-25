const stompit = require('stompit');

let main = (checkInArr) => {
    stompit.connect({
        host: '139.162.7.248',
        port: 61613
    }, function (error, client) {
        const sendHeaders = {
            'destination': '/queue/input_raw_data_student',
            'content-type': 'application/json',
            login: 'admin',
            passcode: 'Password@123'
        };
        console.log(checkInArr);
        for (const item of checkInArr) {
            delete item.sent_to_main_server;
        }
        const contentToSend = JSON.stringify(checkInArr);

        const frame = client.send(sendHeaders);
        frame.write(contentToSend);
        frame.end();

        // const subscribeHeaders = {
        //     'destination': '/queue/update_student',
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

        //         // client.disconnect();
        //     });
        // });
    });
}

module.exports = {
    main: main
}

// main("ABCDER");