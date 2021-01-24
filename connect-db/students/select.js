const connection = require("../connection.js");

async function select(conditional) {
    try {
        let query = "SELECT * FROM student WHERE " + conditional;
        return await connection(query).then(async result => {
            // console.log("ABCDEEEEEE");
            // console.log(result);
            return JSON.parse(JSON.stringify(result));
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}

 async function selectAll() {
    try {
        let query = "SELECT * FROM student";
        return await connection(query).then(async result => {
            
            return JSON.parse(JSON.stringify(result));
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}

async function create(schema, information) {
    try {
        let query = "INSERT INTO student (" + schema + ")" + " VALUE (" + information + ")";
        return await connection(query).then(result => {
            
            return result;
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}

// async function checkExist()

async function remove(id) {
    try {
        let query = "DELETE FROM student WHERE id=" + id;
        return await connection(query).then(result => {
            
            return result;
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}

async function update(id, information) {
    try {
        let query = "UPDATE student SET " + information + " WHERE id=" + id;
        return await connection(query).then(result => {
            return result;
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}

async function checkExist(studentId){
    try {
        let query = "SELECT * FROM student WHERE id='"+studentId+"'";
        return await connection(query).then(results => {
            // console.log(results);
            return JSON.parse(JSON.stringify(results));
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}

async function checkExistWithPersonID(studentId){
    try {
        let query = "SELECT * FROM student WHERE id='"+studentId+"' AND person_id IS NOT NULL";
        return await connection(query).then(results => {
            // console.log(JSON.parse(JSON.stringify(results)));
            return JSON.parse(JSON.stringify(results));
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    select: select,
    selectAll: selectAll,
    create: create,
    remove: remove,
    update: update,
    checkExist: checkExist,
    checkExistWithPersonID: checkExistWithPersonID
}