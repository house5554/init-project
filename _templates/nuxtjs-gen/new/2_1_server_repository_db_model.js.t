---
to: server/repository/<%= h.inflection.camelize(db) %>/model/<%= h.inflection.camelize(name) %>.js
---
<% if(db=='dynamoose'){ %>
import { Schema } from 'dynamoose';

const <%= h.inflection.camelize(name) %>Schema = new Schema({

},{
  timestamps: true,
});

export default <%= h.inflection.camelize(name) %>Schema;

<% } else if (db=='mongoose'){ %>
import {
  Schema
} from 'mongoose';
const schema = new Schema({
  username: {
    type: String
  }
}, {
    timestamps: true,
});
export default <%= h.inflection.camelize(name) %>Schema;

<% } else if (db == "mysql" || db == "mariadb" || db == "postgres" || db == "mssql"){ %>
const sequelize = require('../../../config/database');
const { Sequelize, DataTypes, Model } = sequelize;
const <%= h.inflection.camelize(name) %> = sequelize.define('<%= h.inflection.camelize(name) %>', {
  // attributes
  username: {
    type: Sequelize.STRING,
  },
  password: {
    type: Sequelize.STRING
  }
}, {
  timestamps: true,
  freezeTableName: true,
  // options
});
(async () => {
  await <%= h.inflection.camelize(name) %>.sync();
  // Code here
})();
export default <%= h.inflection.camelize(name) %>;

<% } %>
