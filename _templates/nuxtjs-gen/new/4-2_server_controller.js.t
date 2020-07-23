---
to: server/controller/<%= h.inflection.camelize(name) %>Controller.js
---
var express = require("express");
var router = express.Router();
const <%= h.inflection.camelize(name) %>Service = require('../usecase/<%= h.inflection.camelize(name) %>');
const service = new <%= h.inflection.camelize(name) %>Service();
router.get("/find", async function (req, res, next) {
  console.log("**** GET /find ****");
  const result = await service.getAllUser();
  res.json(result)
});
module.exports = router;
