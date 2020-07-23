---
to: package.json
---
{
  "name": "<%= name.toLowerCase() %>",
  "version": "1.0.0",
  "description": "My glorious Nuxt.js project",
  "author": "김용진",
  "private": true,
  "babel": {
    "presets": [
      "env"
    ]
  },
  "scripts": {
    "dev": "cross-env NODE_ENV=development nodemon --exec babel-node server/index.js --watch server",
    "build": "nuxt build",
    "start": "cross-env NODE_ENV=production node server/index.js",
    "generate": "nuxt generate",
    "test": "jest"
  },
  "dependencies": {
    "nuxt": "^2.0.0",
    "cross-env": "^5.2.0",
    "express": "^4.16.4"
  },
  "devDependencies": {
    "nodemon": "^1.18.9",
    "@vue/test-utils": "^1.0.0-beta.27",
    "babel-cli": "^6.26.0",
    "babel-preset-env": "^1.7.0",
    "babel-jest": "^24.1.0",
    "jest": "^24.1.0",
    "vue-jest": "^4.0.0-0"
  }
}