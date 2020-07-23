---
inject: true
to: package.json
after: dependencies
skip_if: shortid
# sh: cd <%= cwd %> && npm install
---
 "shortid":"^2.2.15",
