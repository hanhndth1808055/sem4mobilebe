// const dbtest = require("./connect-db/students/select.js");

const faceService = require('./service/face-ai-service');

// const test = async (groupName) => {
    // console.log(groupName);
    // let personGroups = await faceService.showAllPersonGroup();
    // console.log(personGroups);
    // console.log(personGroups == "[]");
    // if(personGroups  == "[]") {
    //     console.log("OKKKk");
        // await faceService.createPersonGroup(groupName).then(res => console.log(res));
        // await faceService.trainPersonGroup(groupName).then(res => console.log(res));
    // }
// }

// test("car1");

const test2 = async (groupName) => {
    // console.log(groupName);
    let personGroups = await faceService.detectFace(groupName, "./input.jpg");
    // console.log(personGroups);
    // console.log(personGroups == "[]");
    // if(personGroups  == "[]") {
    //     console.log("OKKKk");
    //     await faceService.createPersonGroup(groupName).then(res => console.log(res));
    //     await faceService.trainPersonGroup(groupName).then(res => console.log(res));
    // }
}

test2("car1");