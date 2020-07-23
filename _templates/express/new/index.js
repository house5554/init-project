// my-generator/my-action/index.js
const databases = ['mongoose', 'dynamoose', "mysql", "mariadb", "postgres", "mssql"]
module.exports = {
    prompt: async ({
        prompter,
        args
    }) => {
        const q1 = await prompter.prompt({
            type: 'select',
            name: 'db_database',
            message: "데이터베이스 선택 하세요.",
            choices: databases
        })
        let url = ""
        if (q1.db_database == 'mongoose') {
            url = "localhost:27017"
        } else if (q1.db_database == 'dynamoose') {
            url = ""
        } else if (q1.db_database == 'mysql') {
            url = "localhost:3306"
        } else if (q1.db_database == 'mariadb') {
            url = "localhost:3306"
        } else if (q1.db_database == 'postgres') {
            url = "localhost:5432"
        } else if (q1.db_database == 'mssql') {
            url = "localhost:1433"
        }
        let q2 = await prompter.prompt({
            type: 'input',
            name: 'db_url',
            message: `데이터베이스 연결 주소:포트를 입력해주세요 예)${url}`
        })
        if (q2.db_url == "") q2.db_url = url
        const q3 = await prompter.prompt({
            type: 'input',
            name: 'db_options',
            message: "데이터베이스 유저(AWS_ACCESS_KEY_ID)/패스워드(AWS_SECRET_ACCESS_KEY)/데이터베이스이름/auth_source(AWS_REGION) 를 입력해주세요 예)user/qwer1234/test_db"
        })
        let options = {}
        const {
            db_options
        } = q3;
        const inputArray = db_options.split("/")
        options.db_username = (inputArray[0] && inputArray[0] != '') ? inputArray[0] : 'postgres';
        options.db_password = (inputArray[1] && inputArray[1] != '') ? inputArray[1] : '0000';
        options.db_name = (inputArray[2] && inputArray[2] != '') ? inputArray[2] : 'test';
        options.db_auth_source = inputArray[3];
        const q4 = await prompter.prompt({
            type: 'multiselect',
            name: 'etc',
            hint: '(Use <space> to select, <return> to submit)',
            message: "기타 기능 설정",
            choices: [{
                    name: 'graphql',
                    value: "graphql",
                    hint: '(graphql 사용)'
                },
                {
                    name: 'bootstrap',
                    value: "bootstrap",
                    hint: '(bootstrap 사용)'
                }
            ]
        })
        console.log('q4', q4)
        console.log('all', Object.assign({},{name:"express"}, args, q1, q2, q4, options))
        return Object.assign({},{name:"express"}, args, q1, q2, q4, options)
        // const nextAnswers = await prompter.prompt({
        //     type: 'select',
        //     name: 'db',
        //     message: '데이터베이스 선택 하세요.',
        //     choices: databases
        // })
        // return Object.assign({}, answers, nextAnswers)
    }
}
// module.exports = {
//     prompt: ({
//         prompter,
//         args
//     }) => {

//         if (args.name == undefined) {
//             return prompter.prompt({
//                 type: 'input',
//                 name: 'name',
//                 message: "파일이름을 입력해주세요."
//             }).then(answers => {
//                 const {
//                     db
//                 } = answers
//                 if (db != undefined && databases.indexOf(db) != -1) {
//                     return Promise.resolve(Object.assign({}, answers))
//                 }
//                 return prompter.prompt({
//                     type: 'select',
//                     name: 'db',
//                     message: '데이터베이스 선택 하세요.',
//                     choices: databases
//                 }).then(nextAnswers => Object.assign({}, answers, nextAnswers))
//             })
//         } else {
//             const {
//                 db
//             } = args
//             if (db != undefined && databases.indexOf(db) != -1) {
//                 return Promise.resolve(Object.assign({}, args))
//             }
//             return prompter.prompt({
//                 type: 'select',
//                 name: 'db',
//                 message: '데이터베이스 선택 하세요.',
//                 choices: databases
//             }).then(nextAnswers => Object.assign({}, args, nextAnswers))
//         }

//     }
// }