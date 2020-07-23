---
to: server/usecase/<%= h.inflection.camelize(name) %>.js
---
const <%= h.inflection.camelize(name) %>Repository<%= h.inflection.camelize(db) %> = require('../repository/<%= h.inflection.camelize(db) %>/<%= h.inflection.camelize(name) %>Repository');

class <%= h.inflection.camelize(name) %>Service {
  constructor() {
    this.repository = new <%= h.inflection.camelize(name) %>Repository<%= h.inflection.camelize(db) %>()
  }
  getAllUser() {
    return this.repository.find();
  }
}

module.exports = <%= h.inflection.camelize(name) %>Service;

