---
to: config/index.js
---
module.exports = (server) => {
    const database = require('./database');
    return {
        database
    }
};