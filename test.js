// const dbtest = require("./connect-db/students/select.js");

const faceService = require('./service/face-ai-service');

const test = async (groupName) => {
    // console.log(groupName);
    let personGroups = await faceService.showAllPersonGroup();
    console.log(personGroups);
    // console.log(personGroups == "[]");
    if(personGroups  == "[]") {
        // console.log("OKKKk");
        await faceService.createPersonGroup(groupName).then(res => console.log(res));
        await faceService.trainPersonGroup(groupName).then(res => console.log(res));
    }
}

// test("car1");

const test2 = async (groupName) => {
    // console.log(groupName);
    // let personGroups = await faceService.detectFace(groupName, "./input.jpg");
    await faceService.trainPersonGroup(groupName).then(res => console.log(res));
    let personGroups = await faceService.detectFace(groupName, "./IMG_20200708_110428.jpg").then(result => {
        console.log(result);
    }
    );
    // console.log(personGroups);
    // console.log(personGroups == "[]");
    // if(personGroups  == "[]") {
    //     console.log("OKKKk");
    //     await faceService.createPersonGroup(groupName).then(res => console.log(res));
    //     await faceService.trainPersonGroup(groupName).then(res => console.log(res));
    // }
}

test2("car1");