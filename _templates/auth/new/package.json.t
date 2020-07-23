inject: true
to: package.json
after: dependencies
# sh: cd <%= cwd %> && npm install
---
"passport": "^0.4.1",
    "passport-google-oauth": "^2.0.0",
    "passport-jwt": "^4.0.0",
    "passport-kakao": "^1.0.0",
        "express-session": "^1.17.1",
        "jsonwebtoken": "^8.5.1",