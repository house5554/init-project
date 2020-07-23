---
to: "<%= etc.indexOf('graphql') >= 0 ? 'server/graphql/index.js' : null %>"
inject: true
at_line: 1
---
const {
  <%= h.inflection.camelize(name) %>TC,
  <%= h.inflection.camelize(name) %>
} = require("./<%= h.inflection.camelize(name) %>");
