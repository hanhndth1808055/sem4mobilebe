const mysql = require('mysql');

const con = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "dENvAU06@)@)",
    database: "sem4"
});

async function connection() {
    return await new Promise((resolve, reject) => {
        if (con.state === 'disconnected') {
            con.connect((err) => {
                if (err) reject(err);
                resolve(con);
            });
        } else if (con.state === 'authenticated') {
            resolve(con);
        }
    });
}

function closeSession() {
    return con.end;
}

module.exports = {
    connection: connection,
    closeSession: closeSession
}