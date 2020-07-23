---
inject: true
to: package.json
after: dependencies
skip_if: dynamoose
# sh: cd <%= cwd %> && npm install
---
"dynamoose":"^2.2.1",
