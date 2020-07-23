---
to: server/routes/index.js
---
var <%= name.toLowerCase() %> = require('<%= name.toLowerCase() %>');
var router = <%= name.toLowerCase() %>.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: '<%= h.capitalize(name) %>' });
});

module.exports = router;
