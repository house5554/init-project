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
        const q2 = await prompter.prompt({
            type: 'input',
            name: 'db_url',
            message: "데이터베이스 연결 주소:포트를 입력해주세요 예)localhost:27017"
        })
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
        options.db_username = inputArray[0];
        options.db_password = inputArray[1];
        options.db_name = inputArray[2];
        options.db_auth_source = inputArray[3];


        console.log(Object.assign({}, args, q1, q2, options))
        return Object.assign({}, args, q1, q2, options)
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