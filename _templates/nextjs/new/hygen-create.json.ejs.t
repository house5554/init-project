---
to: hygen-create.json
---
{
  "about": "This is a hygen-create definitions file. The hygen-create utility creates generators that can be executed using hygen.",
  "hygen_create_version": "0.2.0",
  "name": "<%= name.toLowerCase() %>",
  "files_and_dirs": {
    "hygen-create.json": true,
    "README.md": true,
    "package.json": true,
    "pages/index.js": true,
    "public/vercel.svg": true,
    "pages/api/hello.js": true
  },
  "templatize_using_name": "<%= name.toLowerCase() %>",
  "gen_parent_dir": false
}