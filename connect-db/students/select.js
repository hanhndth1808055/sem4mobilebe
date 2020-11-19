const connection = require("../connection.js");

async function select(conditional) {
    try {
        let db = await connection.connection();
        return new Promise((resolve, reject) => {
            let query = "SELECT * FROM student WHERE " + conditional;
            db.query(query, (err, results) => {
                if (err) reject(err);
                resolve(results);
            });
        });
    } catch (error) {
        console.log(error);
    }
}

async function selectAll() {
    try {
        let db = await connection.connection();
        return new Promise((resolve, reject) => {
            db.query("SELECT * FROM student", (err, results) => {
                if(err) reject(err);
                resolve(results);
            });
        });
    } catch (error) {
        console.log(error);
    }
}

async function create(schema, information) {
    try {
        let db = await connection.connection();
        return new Promise((resolve, reject) => {
            let query = "INSERT INTO student ("+schema+")" + " VALUE ("+information+")";
            db.query(query, (err, results) => {
                if(err) reject(err);
                resolve(results);
            });
        })
    } catch (error) {
        console.log(error);
    }
}

// async function checkExist()

async function remove(id) {
    try {
        let db = await connection.connection();
        return new Promise((resolve, reject) => {
            let query = "DELETE FROM student WHERE id=" + id;
            db.query(query, (err, results) => {
                    if(err) reject(err);
                    resolve(results);
            });
        });
    } catch (error) {
        console.log(error);
    }
}

async function update(id, information) {
    try {
        let db = await connection.connection();
        return new Promise((resolve, reject) => {
            let query = "UPDATE student SET "+information+" WHERE id="+id;
            db.query(query, (err, results) => {
                if(err) reject(err);
                resolve(results);
            });
        });
    } catch(error) {
        console.log(error);
    }
}

module.exports = {
    select: select,
    selectAll: selectAll,
    create: create,
    remove: remove,
    update: update
}