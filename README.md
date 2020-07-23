## 설정 및 프로젝트 
해당 프로젝트는 nodejs 기반 초기 프로젝트 설정을 도와줍니다.
사용하기 먼저 npm i hygen -g 설치 하셔야 합니다.
현재 완성본은 express 서버 설정 관련 테스팅 완료 하였으며,
nuxtjs 및 nextjs 는 추가 완성 되고 테스트 후 배포 할 예정입니다.
앞으로 auth 관련 passport 설정.
aws-sdk s3 설정 등등
추가 할 예정입니다.
사용하시다 문제 있는 경우 알려주시면 수정하겠습니다

## 사용 설명
1. npm i hygen -g 설치
2. git 클론 받으신 후 루트 폴더 이동
3. 아래 명령어 입력
## 빈 프로젝트 생성
```bash
hygen express[ nuxtjs | nextjs | express ] new [--args value]

ex) hygen express new

args = {
    db_database   --> choices 'mongoose', 'dynamoose', "mysql", "mariadb", "postgres", "mssql"
    db_url        --> localhost:27017
    db_options    --> username(AWS_ACCESS_KEY_ID)/password(AWS_SECRET_ACCESS_KEY)/database name(AWS="" | null)/auth_source(AWS_REGION)  
                  --> ex) user/qwer1234/test_db/admin|''
}
```

## 프로젝트 내 파일 아키텍쳐 생성
```bash
hygen express-gen[ nuxtjs | nextjs-gen ] new [--args value]

ex) hygen express-gen new --name user --db dynamoose
args = {
    name      --> file name
    db        --> choices 'mongoose', 'dynamoose', "mysql", "mariadb", "postgres", "mssql"
}
```


# Initial setup

```bash
npm i hygen -g
hygen nuxtjs[ nuxtjs | nextjs | express ] new [--args value]

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

