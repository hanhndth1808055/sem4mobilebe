const studentDb = require('./connect-db/students/select');

// let abc = async() => {
//     let result = await studentDb.checkExist(9876);
//     console.log(result.ColumnDef);
// } 

// let abc = async() => {
//     let result = await studentDb.select("id = 9876");
//     console.log(result);
// } 

// let abc = async() => {
//     let result = await studentDb.selectAll();
//     console.log(result);
// }

// let abc = async() => {
//     let result = await studentDb.create("address, car_id, class_id, date_of_birth, full_name, gender, images, is_active, parents_id, phone_number, school_id, start_date, person_id, face_id", "'Mac Thai To, Cau Giay', '29C2-017.34', 1, '2020-02-09 00:00:00', 'Daisy Nguyen', 'female', 'https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png', 1, 1, '0966977667', '1', NULL, '54077641-9d73-44c7-acb7-8747f674ddcf', NULL");
//     console.log(result.insertId);
// }

// let abc = async() => {
//     let result = await studentDb.remove(9879);
//     console.log(result);
// }

let abc = async() => {
    let result = await studentDb.update(9878,"full_name = 'NguyenDoanHanh111'");
    console.log(result);
}
abc();