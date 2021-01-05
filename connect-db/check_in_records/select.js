const connection = require("../connection.js");

async function select(conditional) {
    try {
        // let db = await connection.connection();
        // return new Promise((resolve, reject) => {
        let query = "SELECT * FROM check_in_records WHERE " + conditional;
        return await connection(query).then(result => {
            console.log(result);
            return result;
        }).catch(err => {
            console.log(err);
        });
        // db.query(query, (err, results) => {
        //     if (err) reject(err);
        //     // console.log(results);
        //     resolve(results);
        // });
        // });
    } catch (error) {
        console.log(error);
    }
}

async function selectAll() {
    try {
        let query = "SELECT * FROM check_in_records";
        return await connection(query).then(result => {
            console.log(result);
            return result;
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}

async function create(schema, information) {
    try {
        let query = "INSERT INTO check_in_records (" + schema + ")" + " VALUE (" + information + ")";
        return await connection(query).then(result => {
            console.log(result);
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
        let query = "DELETE FROM check_in_records WHERE id=" + id;
        return await connection(query).then(result => {
            console.log(result);
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
        let query = "UPDATE check_in_records SET " + information + " WHERE id=" + id;
        return await connection(query).then(result => {
            console.log(result);
            return result;
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}


async function checkExist(check_in_record_id) {
    try {
        let query = "SELECT EXISTS(SELECT * FROM check_in_records WHERE id='" + check_in_record_id + "')";
        return await connection(query).then(result => {
            console.log(result);
            let objResult = JSON.parse(JSON.stringify(results))[0];
            return Object.entries(objResult)[0][1];
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
    // try {
    //     let db = await connection.connection();
    //     return new Promise((resolve, reject) => {
    //         let query = "SELECT EXISTS(SELECT * FROM check_in_records WHERE id='" + check_in_record_id + "')";
    //         console.log(query);
    //         db.query(query, (err, results) => {
    //             if (err) reject(err);
    //             console.log(results);
    //             let objResult = JSON.parse(JSON.stringify(results))[0];
    //             resolve(Object.entries(objResult)[0][1]);
    //         });
    //     });
    // } catch (error) {
    //     console.log(error);
    // }
}

module.exports = {
    select: select,
    selectAll: selectAll,
    create: create,
    remove: remove,
    update: update,
    checkExist: checkExist
}