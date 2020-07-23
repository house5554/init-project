---
to: config/database.js
---
const config = require("../../env.json")["development"];
<% if(db_database=='mongoose'){ %>
async function db_start(){
    const mongoose = require('mongoose');
    await mongoose.connect(`mongodb://${config.DB_URL}/${config.DB_NAME}`, {
        authSource: `${config.DB_AUTH_SOURCE}`,
        user: `${config.DB_USERNAME}`,
        pass: `${config.DB_PASSWORD}`,
        useNewUrlParser: true
    })  
}
db_start()
<% } else if (db_database=='dynamoose'){ %>
function db_start(){
    const dynamoose = require('dynamoose');
    const ddb = new dynamoose.aws.sdk.DynamoDB({
        "accessKeyId": `${config.DB_USERNAME}`,
        "secretAccessKey": `${config.DB_PASSWORD}`,
        "region": `${config.DB_AUTH_SOURCE}`
    });
    dynamoose.model.defaults.set({
        create: true, // Create table in DB if it does not exist
        //prefix: options.dev ? "TEST_" : '', // Default prefix for all DynamoDB tables
        suffix: '' // Default suffix for all DynamoDB tables
    })
    // Set DynamoDB instance to the Dynamoose DDB instance
    dynamoose.aws.ddb.set(ddb);
    return dynamoose
}
module.exports = db_start()
<% } else if(db_database == "mysql" || db_database == "mariadb" || db_database == "postgres" || db_database == "mssql"){ %>
function db_start(){
    const Sequelize = require('sequelize');
    const sequelize = new Sequelize(`${config.DB_DATABASE}://${config.DB_USERNAME}:${config.DB_PASSWORD}@${config.DB_URL}/${config.DB_NAME}`);
    return sequelize
}
module.exports = db_start()
<%} %>