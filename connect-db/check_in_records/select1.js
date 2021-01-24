const connection = require("../connection.js");

async function select(conditional) {
    try {
        let db = await connection.connection();
        return new Promise((resolve, reject) => {
            let query = "SELECT * FROM check_in_records WHERE " + conditional;
            db.query(query, (err, results) => {
                if (err) reject(err);
                // console.log(results);
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
            db.query("SELECT * FROM check_in_records", (err, results) => {
                if (err) reject(err);
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
            let query = "INSERT INTO check_in_records (" + schema + ")" + " VALUE (" + information + ")";
            db.query(query, (err, results) => {
                if (err) reject(err);
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
            let query = "DELETE FROM check_in_records WHERE id=" + id;
            db.query(query, (err, results) => {
                if (err) reject(err);
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
            let query = "UPDATE check_in_records SET " + information + " WHERE id=" + id;
            db.query(query, (err, results) => {
                if (err) reject(err);
                resolve(results);
            });
        });
    } catch (error) {
        console.log(error);
    }
}


async function checkExist(check_in_record_id) {
    try {
        let db = await connection.connection();
        return new Promise((resolve, reject) => {
            let query = "SELECT EXISTS(SELECT * FROM check_in_records WHERE id='" + check_in_record_id + "')";
            // console.log(query);
            db.query(query, (err, results) => {
                if (err) reject(err);
                console.log(results);
                let objResult = JSON.parse(JSON.stringify(results))[0];
                resolve(Object.entries(objResult)[0][1]);
            });
        });
    } catch (error) {
        console.log(error);
    }
}

async function notYetCheckIn(student_id) {
    try {
        let db = await connection.connection();
        return new Promise((resolve, reject) => {
            let query = "SELECT * FROM check_in_records WHERE student_id='" + student_id + "' AND DATE(date_time) = CURRENT_DATE()";
            // console.log(query);
            db.query(query, (err, results) => {
                if (err) reject(err);
                console.log(results);
                if (JSON.stringify(JSON.parse(JSON.stringify(results))) == "[]") {
                    return true;
                } else {
                    return false;
                }
            });
        });
    } catch (error) {
        console.log(error);
    }
}


async function checkedInAlready(student_id) {
    try {
        let db = await connection.connection();
        return new Promise((resolve, reject) => {
            let query = "SELECT * FROM check_in_records WHERE student_id='" + student_id + "' AND DATE(date_time) = CURRENT_DATE() AND date_time > DATE_SUB(NOW(), INTERVAL '05:0' MINUTE_SECOND)";
            db.query(query, (err, results) => {
                if (err) reject(err);
                console.log(results);
                if (JSON.stringify(JSON.parse(JSON.stringify(results))) == "[]") {
                    resolve(Object.entries(objResult)[0][1]);
                    return true;
                } else {
                    return false;
                }
            });
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
    notYetCheckIn: notYetCheckIn,
    checkedInAlready: checkedInAlready
}