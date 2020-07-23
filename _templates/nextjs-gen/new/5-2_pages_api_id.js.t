---
to: pages/api/<%= h.inflection.camelize(name) %>/[id].js
---
import nextConnect from 'next-connect';
import middleware from '../../../middleware/middleware';
import Controller from '../../../server/controller/Controller';

const <%= h.inflection.camelize(name) %>Controller = require('../../../server/controller/<%= h.inflection.camelize(name) %>Controller');

const handler = nextConnect();
handler.use(middleware);

handler.get(async (req, res) => {
    try {
        const response = await new <%= h.inflection.camelize(name) %>Controller().find(req.query);
        Controller.Nextjs(response, res);
    } catch (err) {
        res.status(500).json({
            message: err.toString(),
        });
    }
});

handler.post(async (req, res) => {
    try {
        const response = await new <%= h.inflection.camelize(name) %>Controller().create(req.body);
        Controller.Nextjs(response, res);
    } catch (err) {
        res.status(500).json({
            message: err.toString(),
        });
    }
});

export default handler;
