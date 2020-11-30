"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs-extra");
const buffer_1 = require("buffer");
function getFriends(dirName) {
    const fullDirName = __dirname + '/' + dirName;
    let toReturn = [];
    let results = fs.readdirSync(fullDirName);
    results.forEach(result => {
        if (fs.statSync(fullDirName + '/' + result).isDirectory()) {
            toReturn.push(result);
        }
    });
    return toReturn;
}
exports.getFriends = getFriends;
function getFriendPictures(fatherDirectory, friendName) {
    let toReturn = [];
    const fullDirName = __dirname + '/'+fatherDirectory+'/' + friendName;
    let results = fs.readdirSync(fullDirName);
    results.forEach(result => {
        if (result.endsWith('jpg')) {
            toReturn.push(result);
        }
    });
    return toReturn;
}
exports.getFriendPictures = getFriendPictures;
function readImage(filePath) {
    const fileData = fs.readFileSync(filePath).toString("hex");
    const result = [];
    for (let i = 0; i < fileData.length; i += 2) {
        result.push(parseInt(fileData[i] + "" + fileData[i + 1], 16));
    }
    return new buffer_1.Buffer(result);
}
exports.readImage = readImage;

async function setFriendPictures(fatherDirectory, friendName, file) {
    let toReturn = [];
    const fullDirName = __dirname + '/'+fatherDirectory+'/' + friendName;
    await fs.mkdir(fullDirName, { recursive: true }, (err) => {
        if(err) console.log(err);
      });

      let fileName = await file.name;
      let fileData = await file.data;
    let results = await fs.writeFile(fullDirName+'/'+fileName, fileData, {encoding: 'base64'});
    toReturn.push(results);
    return toReturn;
}
exports.setFriendPictures = setFriendPictures;
