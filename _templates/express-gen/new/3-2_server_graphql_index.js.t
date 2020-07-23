---
to: "<%= etc.indexOf('graphql') >= 0 ? 'graphql/index.js' : null %>"
unless_exists: true
---
const schemaComposer = require("graphql-compose").schemaComposer;


module.exports = schemaComposer.buildSchema();
