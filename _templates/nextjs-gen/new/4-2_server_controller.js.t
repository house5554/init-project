---
to: server/controller/<%= h.inflection.camelize(name) %>Controller.js
---
import Controller from './Controller';
const <%= h.inflection.camelize(name) %>Service = require('../usecase/<%= h.inflection.camelize(name) %>');

class <%= h.inflection.camelize(name) %>Controller {
  constructor() {
    this.service = new <%= h.inflection.camelize(name) %>Service();
  }
  async find(request) {
    try {
      const result = await this.service.getAllUser(request);
      return Controller.Response(result, 200, 'application/json');
    } catch (err) {
      return Controller.Response(err.toString(), 500, 'application/json');
    }
  }

}

module.exports = <%= h.inflection.camelize(name) %>Controller;
