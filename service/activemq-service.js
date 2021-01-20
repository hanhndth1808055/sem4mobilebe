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
    
        const contentToSend = JSON.stringify(checkInArr);
    
        const frame = client.send(sendHeaders);
        frame.write(contentToSend);
        frame.end(); 
    });
}

module.exports = {
    main: main
}