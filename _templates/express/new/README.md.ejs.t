---
to: README.md
---
# Initial setup

```bash
npm i hygen -g
hygen nuxtjs[ nuxtjs | nextjs | <%= name.toLowerCase() %> ] new [--args value]

ex) hygen nuxtjs new

args = {
    db_database   --> choices 'mongoose', 'dynamoose', "mysql", "mariadb", "postgres", "mssql"
    db_url        --> localhost:27017
    db_options    --> username(AWS_ACCESS_KEY_ID)/password(AWS_SECRET_ACCESS_KEY)/database name(AWS="" | null)/auth_source(AWS_REGION)  
                  --> ex) user/qwer1234/test_db/admin|''
}
```

# File generation

```bash
hygen nuxtjs-gen[ nuxtjs | nextjs-gen ] new [--args value]

ex) hygen nuxtjs-gen new --name user --db dynamoose
args = {
    name      --> file name
    db        --> choices 'mongoose', 'dynamoose', "mysql", "mariadb", "postgres", "mssql"
}
```

# Project structure

```
command hygen nuxtjs-gen new

server/
    config/
        index.js
        database.js
    controller/
        {name}Controller.js
    repository/
        {database name}/
            {name}Repository.js
            {name}.js
        Repository.js
    usecase/
        {name}.js
index.js      
```


## Build Setup

```bash
# install dependencies
$ npm install

# serve with hot reload at localhost:3000
$ npm run dev

# build for production and launch server
$ npm run build
$ npm run start

# generate static project
$ npm run generate
```

