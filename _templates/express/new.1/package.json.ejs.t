---
to: package.json
---
{
  "name": "testnext",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "dev": "nodemon --exec babel-node ./bin/www --watch server"
    "start": "node ./bin/www"
  },
  "dependencies": {
    "cookie-parser": "~1.4.4",
    "debug": "~2.6.9",
    "ejs": "~2.6.1",
    "<%= name.toLowerCase() %>": "~4.16.1",
    "http-errors": "~1.6.3",
    "morgan": "~1.9.1"
  },
  "devDependencies": {
    "nodemon": "^1.18.9",
    "@babel/core": "^7.10.2",
    "@babel/node": "^7.10.1",
    "@babel/preset-env": "^7.10.2"
  }
}
