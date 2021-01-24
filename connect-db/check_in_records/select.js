const connection = require("../connection.js");

async function select(conditional) {
    try {
        let query = "SELECT * FROM check_in_records WHERE " + conditional;
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
        return await connection(query).then(results => {
            return JSON.parse(JSON.stringify(results));
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}

async function notYetCheckIn(student_id) {
    try {
        let query = "SELECT * FROM check_in_records WHERE student_id='" + student_id + "' AND DATE(date_time) = CURRENT_DATE()";
        // console.log(query);
        return await connection(query).then(results => {
            if (JSON.stringify(JSON.parse(JSON.stringify(results))) == "[]") {
                return true;
            } else {
                return false;
            }
        }).catch(err => {
            console.log(err);
        });
    } catch (error) {
        console.log(error);
    }
}


async function checkedInAlready(student_id) {
    try {
            let query = "SELECT * FROM check_in_records WHERE student_id='" + student_id + "' AND DATE(date_time) = CURRENT_DATE() AND date_time > DATE_SUB(NOW(), INTERVAL '05:0' MINUTE_SECOND)";
            return await connection(query).then(results => {
                // console.log(results);
                if (JSON.stringify(JSON.parse(JSON.stringify(results))) == "[]") {
                    return true;
                } else {
                    return false;
                }
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