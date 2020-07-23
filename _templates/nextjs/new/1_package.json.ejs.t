---
to: package.json
---
{
  "name": "nextjs",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "nodemon --exec babel-node server/index.js --watch server",
    "build": "next build",
    "start": "next start"
  },
  "dependencies": {
    "next": "9.4.2",
    "react": "16.13.1",
    "react-dom": "16.13.1",
    "next-connect": "^0.6.6",
    "express": "^4.17.1"
  },
  "devDependencies": {
    "nodemon": "^1.18.9",
    "@babel/core": "^7.10.2",
    "@babel/node": "^7.10.1",
    "@babel/preset-env": "^7.10.2"
  }
}
