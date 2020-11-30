// const dbtest = require("./connect-db/students/select.js");

const faceService = require('./service/face-ai-service');

const test = async () => {
    let personGroups = await faceService.showAllPersonGroup();
    console.log(personGroups);
    console.log(personGroups == "[]");
    if(personGroups  == "[]") {
        console.log("OKKKk");
        await faceService.createPersonGroup("car1").then(res => console.log(res));
        await faceService.trainPersonGroup("car1").then(res => console.log(res));
    }
}

test();