var _ = require('lodash');

module.exports = {
    list: function (req, res, next) {
        let post = _.pick(req.body, 'type', 'page', 'perPage');
        let offset = post.perPage * (post.page - 1)
        req.models[post.type].find().order('-id').limit(post.perPage).offset(offset).run(function (err, data) {
            req.models.payments.count(function (err, total) {
                return res.send({ data, total, page: post.page })
            });
        });
    },
    delete: function (req, res, next) {
        let post = _.pick(req.body, 'type', 'id');
        req.models[post.type].get(post.id, function (err, model) {
            model.remove(function (err) {
                return res.send({ data: 'ok' })
            });
        });
    },
    update: function (req, res, next) {
        let post = _.pick(req.body, 'type', 'id', 'data');
        req.models[post.type].get(post.id, function (err, model) {
            let update = JSON.parse(post.data);
            for (let i in update) {
                model[i] = update[i];
            }
            model.save(function (err) {
                return res.send({ data: 'ok' })
            });
        });
    },
    add: function (req, res, next) {
        let post = _.pick(req.body, 'type', 'data');
        let add = JSON.parse(post.data);
        req.models[post.type].create(add, function (err, model) {
            return res.send({ data: 'ok' });
        });
    },
    login: function (req, res, next) {
        let params = _.pick(req.body, 'username', 'password');
        req.models.admin.find(params, function (err, user) {
            if (user.length > 0) {
                // user[0].lastSeen = new Date();
                // user[0].save();
                res.send({ success: true, data: user[0] })
            }
            else {
                res.send({ success: false, message: "loginFailed" })
            }
        })
    }
};
