const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");

//routes
const createStudent = require("./routes/student/create-student");
const updateStudent = require("./routes/student/update-student");
const updateStudentFace = require("./routes/student/update-student-face");

var corsOptions = {
  origin: "*"
}

app.use(cors(corsOptions));

//parse application/json
app.use(bodyParser.json());
//parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({extended: true}));

app.use('/create-student', createStudent);
app.use('/update-student', updateStudent);

app.use('/update-student-face', updateStudentFace);

app.get("/", (req, res) => {
  res.json('Welcome to FATSM Back-end');
});

var server = require("http").Server(app);
server.listen(3333);
console.log("FATSM Back-end is running on port 3333");