---
to: pages/api/hello.js
---
// Next.js API route support: https://<%= name.toLowerCase() %>.org/docs/api-routes/introduction

export default (req, res) => {
  res.statusCode = 200
  res.json({ name: 'John Doe' })
}
