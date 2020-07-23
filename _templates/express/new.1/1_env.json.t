---
to: env.json
---
{
    "development": {
        "DB_DATABASE": "<%= db_database %>",
        "DB_URL": "<%= db_url %>",
        "DB_USERNAME": "<%= db_username %>",
        "DB_PASSWORD": "<%= db_password %>",
        "DB_NAME": "<%= db_name %>",
        "DB_AUTH_SOURCE": "<%= db_auth_source %>"
    },
    "staging": {
        "DB_DATABASE": "",
        "DB_URL": "",
        "DB_USERNAME": "",
        "DB_PASSWORD": "",
        "DB_NAME": "",
        "DB_AUTH_SOURCE": ""
    },
    "production": {
         "DB_DATABASE": "",
        "DB_URL": "",
        "DB_USERNAME": "",
        "DB_PASSWORD": "",
        "DB_NAME": "",
        "DB_AUTH_SOURCE": ""
    }
}
