const mysql = require('mysql');
const pool = mysql.createPool({
    host: 'localhost', 
    user: 'root', 
    password: 'dENvAU06@)@)', 
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
