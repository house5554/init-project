---
inject: true
to: server/routes/api/index.js
at_line: 2
---
router.use('/<%= h.inflection.camelize(name) %>',require('./<%= h.inflection.camelize(name) %>'))

