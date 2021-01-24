const mariadb = require('mariadb');
const pool = mariadb.createPool({
    host: 'localhost', 
    user: 'root', 
    password: 'abc123', 
    port: 3306, 
    database: 'sem4'
});

async function connect(query) {
  let conn;
  try {
	conn = await pool.getConnection();
	// const rows = await conn.query("SELECT 1 as val");
	// console.log(rows); //[ {val: 1}, meta: ... ]
	const res = await conn.query(query, [1, "mariadb"]);
  // console.log(res); // { affectedRows: 1, insertId: 1, warningStatus: 0 }
  return res;
  } catch (err) {
  console.log(err);
  } finally {
	if (conn) conn.end();
  }
}

module.exports = connect;