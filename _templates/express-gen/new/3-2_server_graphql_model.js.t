---
to: server/graphql/<%= h.inflection.camelize(name) %>.js
---
<% if(etc.indexOf('graphql') >= 0){ %>
  const schemaComposer = require('graphql-compose').schemaComposer;
  const customizationOptions = {}; // left it empty for simplicity, described below
  const <%= h.inflection.camelize(name) %>Service = require('../usecase/<%= h.inflection.camelize(name) %>');
  const service = new <%= h.inflection.camelize(name) %>Service();
  const <%= h.inflection.camelize(name) %>TC = schemaComposer.createObjectTC({
    name: '<%= h.inflection.camelize(name) %>',
    fields: {
      username: 'String',
      password: 'String',
    },
  });
  <%= h.inflection.camelize(name) %>TC.addResolver({
    name: 'findAll',
    args: {
      id: 'Int'
    },
    type: [<%= h.inflection.camelize(name) %>TC],
    resolve: async ({
      source,
      args
    }) => {
      const res = await service.getAllUser()
      return res
    },
  });
  schemaComposer.Query.addFields({
    <%= h.inflection.camelize(name) %>FindAll: <%= h.inflection.camelize(name) %>TC.getResolver('findAll'),
  });

  schemaComposer.Mutation.addFields({

  });
  module.exports = {
    schemaComposer,
    <%= h.inflection.camelize(name) %>TC,
    service
  }
<% } %>
