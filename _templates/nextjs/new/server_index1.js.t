---
to: server/index.js
---

const express = require('express');
const next = require('next');

const port = parseInt(process.env.PORT, 10) || 3000;
const dev = process.env.NODE_ENV !== 'production';
const app = next({
    dev
});
const handle = app.getRequestHandler();
require('./config');

app.prepare().then(() => {
    const server = express();
    <% if(etc.indexOf('graphql') >= 0){ %>
        const {
            ApolloServer,
            gql
        } = require('apollo-server-express')
        const MyGraphQLSchema = require('./graphql/index');

        const apollo = new ApolloServer({
            schema: MyGraphQLSchema,
            playground: true,
        });
        apollo.applyMiddleware({
            app: server
        });
    <% } %>
    server.get('*', (req, res) => handle(req, res));
    server.post('*', (req, res) => handle(req, res));
    server.put('*', (req, res) => handle(req, res));
    server.delete('*', (req, res) => handle(req, res));

    server.listen(port, (err) => {
        if (err) throw err;
        console.log(`> Ready on http://localhost:${port}`);
    });
})
.catch((ex) => {
    console.log(ex);
    process.exit(1);
});
