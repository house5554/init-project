---
to: server/controller/Controller.js
unless_exists: true
---
class Controller {
  static Response(result, code = 200, contentType = 'application/json') {
    return { result, code, contentType };
  }

  static Nextjs(response, nextRes) {
    switch (response.contentType) {
      case 'application/json':
        return nextRes.status(response.code).json(response.result);
      default:
        return nextRes.status(response.code).end(response.result);
    }
  }
}

module.exports = Controller;
