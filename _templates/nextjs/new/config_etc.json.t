---
inject: true
to: package.json
after: dependencies
# sh: cd <%= cwd %> && npm install
---
<% if(etc.indexOf('graphql') >= 0){ %>
    "next-apollo" :"^4.0.1",
    "graphql" :"^15.0.0",
    "graphql-compose": "^7.18.1",
    "apollo-boost" :"^0.4.9",
    "@apollo/react-hooks" :"^3.1.5",
    "@apollo/react-ssr":"^3.1.5",
    "apollo-server-express": "^2.14.2",
<% } %>
