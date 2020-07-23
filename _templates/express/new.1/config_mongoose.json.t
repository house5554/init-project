---
inject: true
to: package.json
after: dependencies
skip_if: mongoose
# sh: cd <%= cwd %> && npm install
---
"mongoose":"^5.9.17",
