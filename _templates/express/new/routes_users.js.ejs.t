---
to: server/routes/users.js
---
var <%= name.toLowerCase() %> = require('<%= name.toLowerCase() %>');
var router = <%= name.toLowerCase() %>.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;
