---
inject: true
to: package.json
after: dependencies
# sh: cd <%= cwd %> && npm install
---
<% if(etc.indexOf('graphql') >= 0){ %>
    "graphql" :"^15.0.0",
    "graphql-compose": "^7.18.1",
<% } %>
