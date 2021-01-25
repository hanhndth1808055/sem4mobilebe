const mysql = require('mysql');
const pool = mysql.createPool({
    host: 'localhost', 
    user: 'root', 
    password: 'Password@123', 
    port: 3306, 
    database: 'sem4'
});

const connection = () => {
  return new Promise((resolve, reject) => {
  pool.getConnection((err, connection) => {
    if (err) reject(err);
    // console.log("MySQL pool connected: threadId " + connection.threadId);
    const query = (sql, binding) => {
      return new Promise((resolve, reject) => {
         connection.query(sql, binding, (err, result) => {
           if (err) reject(err);
           resolve(result);
           });
         });
       };
       const release = () => {
         return new Promise((resolve, reject) => {
           if (err) reject(err);
          //  console.log("MySQL pool released: threadId " + connection.threadId);
           resolve(connection.release());
         });
       };
       resolve({ query, release });
     });
   });
 };
const query = (sql, binding) => {
  return new Promise((resolve, reject) => {
    pool.query(sql, binding, (err, result, fields) => {
      if (err) reject(err);
      resolve(result);
    });
  });
};

// module.exports = connect;

// let a = async () => {
//   return await connect("SELECT * FROM student").then( async data => {
// console.log(data);
//   })
// } 

// a();

let main = async(query) => {
  let conn = await connection();
  let result = await conn.query(query); 
  await conn.release();
  return result;
}


module.exports = main;

// const mariadb = require('mariadb');
// const pool = mariadb.createPool({
//     host: 'localhost', 
//     user: 'root', 
//     password: 'dENvAU06@)@)', 
//     port: 3307, 
//     database: 'sem4'
// });

// async function connect(query) {
//   let conn;
//   try {
// 	conn = await pool.getConnection();
// 	// const rows = await conn.query("SELECT 1 as val");
// 	// console.log(rows); //[ {val: 1}, meta: ... ]
// 	const res = await conn.query(query, [1, "mariadb"]);
//   // console.log(res); // { affectedRows: 1, insertId: 1, warningStatus: 0 }
//   return res;
//   } catch (err) {
//   console.log(err);
//   } finally {
// 	if (conn) conn.end();
//   }
// }

// module.exports = connect;