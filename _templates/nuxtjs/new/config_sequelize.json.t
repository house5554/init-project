---
inject: true
to: package.json
after: dependencies
skip_if: sequelize
# sh: cd <%= cwd %> && npm install
---
"sequelize":"^5.21.11",
"pg":"^8.2.1",
"pg-hstore":"^2.3.3",
"mysql2":"^2.1.0",
"mariadb":"^2.4.0",
"sqlite3":"^4.2.0",
"tedious":"^8.3.0",
