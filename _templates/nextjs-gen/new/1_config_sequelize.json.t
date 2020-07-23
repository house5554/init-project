---
inject: true
to: package.json
after: dependencies
skip_if: sequelize
# sh: cd <%= cwd %> && npm install
---
"sequelize":"^5.21.11",
