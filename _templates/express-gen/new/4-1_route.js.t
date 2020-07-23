---
to: server/routes/api/<%= h.inflection.camelize(name) %>.js
---
var express = require('express');
var router = express.Router();
const <%= h.inflection.camelize(name) %>Service = require('../../usecase/<%= h.inflection.camelize(name) %>');
const <%= h.inflection.camelize(name) %> = new <%= h.inflection.camelize(name) %>Service()
// router.use(function (req, res, next) {
//     console.log('Time:', Date.now());
//     next();
// });
/* GET users listing. */
router.get('/', async function(req, res, next) {
    res.json(await <%= h.inflection.camelize(name) %>.getAllUser())
});

module.exports = router;