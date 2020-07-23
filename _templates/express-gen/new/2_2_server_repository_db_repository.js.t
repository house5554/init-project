---
to: server/repository/<%= h.inflection.camelize(db) %>/<%= h.inflection.camelize(name) %>Repository.js
---
<% if(db=='dynamoose'){ %>
import shortid from 'shortid';
import dynamoose from 'dynamoose';
import Schema from './model/<%= h.inflection.camelize(name) %>';

module.exports = class Repository {
  constructor() {
    this.<%= h.inflection.camelize(name) %> = dynamoose.model('<%= h.inflection.camelize(name) %>', Schema);
  }

  async create(entity) {
    const entityDTO = entity;
    entityDTO.id = shortid.generate();
    const dupCheck = await this.get(entity.id);
    if (dupCheck) throw new Error('Duplicated PK is not available.');
    return new this.<%= h.inflection.camelize(name) %>(entityDTO).save();
  }

  async update(entity) {
    const dupCheck = await this.get(entity.id);
    if (!dupCheck) throw new Error('<%= h.inflection.camelize(name) %> not found exception.');
    return this.<%= h.inflection.camelize(name) %>.update(entity.id, entity);
  }

  async delete(id) {
    const dupCheck = await this.get(id);
    if (!dupCheck) throw new Error('<%= h.inflection.camelize(name) %> not found exception.');
    return new this.<%= h.inflection.camelize(name) %>({ id: id }).delete();
  }

  async get(id) {
    return this.<%= h.inflection.camelize(name) %>.get(id).then(async (result) => result);
  }

  async find(query) {
    return this.<%= h.inflection.camelize(name) %>.scan(query).exec().then(async (result) => result);
  }
};

<% } else if (db=='mongoose'){ %>
const mongoose = require('mongoose');
import Schema from './model/<%= h.inflection.camelize(name) %>';
module.exports = class Repository {
  constructor() {
    this.<%= h.inflection.camelize(name) %> = mongoose.model('<%= h.inflection.camelize(name) %>', Schema);
  }

  async create(entity) {
    return await this.<%= h.inflection.camelize(name) %>.create(entity);
  }

  async update(entity) {
    return await this.<%= h.inflection.camelize(name) %>.findOneAndUpdate({_id:entity.id}, entity,{new: true});
  }

  async delete(id) {
    const dupCheck = await this.get(id);
    if (!dupCheck) throw new Error('<%= h.inflection.camelize(name) %> not found exception.');
    return await this.<%= h.inflection.camelize(name) %>.findOneAndRemove({ _id: id });
  }

  async get(id) {
    return await this.<%= h.inflection.camelize(name) %>.findById(id);
  }

  async find(query) {
    return await this.<%= h.inflection.camelize(name) %>.find(query);
  }
};

<% } else if (db == "mysql" || db == "mariadb" || db == "postgres" || db == "mssql"){ %>
import sequelize from 'sequelize';
import Schema from './model/<%= h.inflection.camelize(name) %>';
module.exports = class Repository {
  constructor() {
    this.<%= h.inflection.camelize(name) %> = Schema;
  }

  async create(entity) {
    return await this.<%= h.inflection.camelize(name) %>.create(entity);
  }

  async update(entity) {
    return await this.<%= h.inflection.camelize(name) %>.update(entity, {where: {id: entity.id}});
  }

  async delete(id) {
    return await this.<%= h.inflection.camelize(name) %>.destroy({where: {id: id}});
  }

  async get(id) {
    return await this.<%= h.inflection.camelize(name) %>.findByPk(id);
  }

  async find(query) {
    return (query == undefined || query==null) ? this.<%= h.inflection.camelize(name) %>.findAll() :this.<%= h.inflection.camelize(name) %>.findAll({where:query})
  }
};
<%} %>
