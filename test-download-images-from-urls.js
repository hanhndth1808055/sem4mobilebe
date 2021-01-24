const fs = require('fs')
const request = require('request')

const download = (url, path, callback) => {
  request.head(url, (err, res, body) => {
    request(url)
      .pipe(fs.createWriteStream(path))
      .on('close', callback)
  })
}

const url = "https://res.cloudinary.com/dyfmulxle/image/upload/v1611318867/vue-upload/sdlsrhzq5kbn2jbomg05.jpg"
const path = './image.jpg'

download(url, path, () => {
  console.log('✅ Done!')
})