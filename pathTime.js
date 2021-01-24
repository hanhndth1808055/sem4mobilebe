pathTime = (modifyTime)=>{
    let today = new Date(modifyTime);
    let dd = String(today.getDate()).padStart(2, '0');
    let MM = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    let yyyy = today.getFullYear();

    let hh = String(today.getHours()).padStart(2, '0');
    let mm = String(today.getMinutes()).padStart(2, '0');
    let ss = String(today.getSeconds()).padStart(2, '0');

    let day = dd+'-'+MM+'-'+yyyy;
    let pathTime = yyyy+'/'+yyyy+MM+dd;
    let stringDate = yyyy+MM+dd;
    let stringDateTime = yyyy+MM+dd+hh+mm+ss;
    let sqlDate = yyyy+'-'+MM+'-'+dd;
    let year = yyyy;
    let originalTime = yyyy+"-"+MM+"-"+dd+" "+hh+':'+mm+':'+ss;
    
    return {
        logName: day,
        currentTime: day+' '+hh+':'+mm+':'+ss,
        pathTime: pathTime,
        full: yyyy+"-"+MM+"-"+dd+" "+hh+':'+mm+':'+ss,
        stringDate: stringDate,
        sqlDate: sqlDate,
        year: year,
        stringDateTime: stringDateTime,
        originalTime: originalTime,
        time: hh+':'+mm+':'+ss,
    };
}

module.exports = pathTime;