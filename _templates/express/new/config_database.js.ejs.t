---
to: config/database.js
---
const config = require("../../env.json")["development"];

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
