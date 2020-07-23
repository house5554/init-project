---
to: server/repository/<%= h.inflection.camelize(name) %>Repository.js
---
module.exports = class {
  constructor(repository) {
    this.repository = repository;
  }

  create(entity) {
    return this.repository.create(entity);
  }

  update(entity) {
    return this.repository.update(entity);
  }

  delete(id) {
    return this.repository.delete(id);
  }

  get(id) {
    return this.repository.get(id);
  }

  find(query) {
    return this.repository.find(query);
  }
};