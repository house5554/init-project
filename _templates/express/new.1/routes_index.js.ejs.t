---
to: routes/index.js
---
var <%= name.toLowerCase() %> = require('<%= name.toLowerCase() %>');
var router = <%= name.toLowerCase() %>.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: '<%= h.inflection.camelize(name) %>' });
});

module.exports = router;
