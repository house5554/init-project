---
inject: true
to: server/index.js
after: 'start'
---
app.use('/<%= name %>',  require('./controller/<%= h.inflection.camelize(name) %>Controller'));
