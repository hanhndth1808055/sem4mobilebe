function converter(information) {
    let values = [];
    let keys = [];

    let objectToArray = Object.entries(information);

    for(let property of objectToArray) {
        keys.push(property[0]);
        // console.log(typeof(property[1]));
        if(Number.isInteger(property[1])) {
            values.push(Number.parseInt(property[1]));
        }else {
            values.push("'"+property[1]+"'");
        }
        
    };

    let key = keys.join(",");
    let value = values.join(",");
    return {
        schema: key,
        record: value
    }
}

function convertForUpdate(information) {
    let field = [];
    let objectToArray = Object.entries(information);
    for (const property of objectToArray) {
        if(Number.isInteger(property[1])) {
            field.push(property[0] + "=" + property[1]);
        } else {
            field.push(property[0] + "='" + property[1]+"'");
        }
    }
    return field.join(",");
}

module.exports = {
    converter: converter,
    convertForUpdate: convertForUpdate
}