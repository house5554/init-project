---
to: package.json
---
{
  "name": "nuxtjs",
  "version": "1.0.0",
  "description": "My glorious Nuxt.js project",
  "author": "김용진",
  "private": true,
  "scripts": {
    "dev": "cross-env NODE_ENV=development nodemon server/index.js --watch server",
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
    "babel-jest": "^24.1.0",
    "jest": "^24.1.0",
    "vue-jest": "^4.0.0-0"
  }
}