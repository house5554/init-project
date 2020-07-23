// my-generator/my-action/index.js
const databases = ['mongoose', 'dynamoose', "mysql", "mariadb", "postgres", "mssql"]
module.exports = {
    prompt: async ({
        prompter,
        args
    }) => {
        if (args.name == undefined) {
            const answers = await prompter.prompt({
                type: 'input',
                name: 'name',
                message: "파일이름을 입력해주세요."
            })
            const {
                db,
                name
            } = answers
            if (db != undefined && databases.indexOf(db) != -1) {
                return Object.assign({}, args, answers)
            }
            const nextAnswers = await prompter.prompt({
                type: 'select',
                name: 'db',
                message: '데이터베이스 선택 하세요.',
                choices: databases
            })
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
            return Object.assign({}, answers, nextAnswers, q4)
        }
        const {
            db
        } = args
        if (db != undefined && databases.indexOf(db) != -1) {
            return Object.assign({}, args)
        }
        const nextAnswers = await prompter.prompt({
            type: 'select',
            name: 'db',
            message: '데이터베이스 선택 하세요.',
            choices: databases
        })
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
        return Object.assign({}, args, nextAnswers, q4)
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