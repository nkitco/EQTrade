var _ = require('lodash');

module.exports = {
    paymentsList: function (req, res, next) {
        let post = _.pick(req.body, 'type', 'page', 'perPage');
        let offset = post.perPage * (post.page - 1)
        req.models.user.find({token: req.body.token}, 1, function (err, user) {
            req.models[post.type].find({user_id: user[0].id}).order('-id').limit(post.perPage).offset(offset).run(function (err, data) {
                req.models[post.type].count(function (err, total) {
                    for (let d of data) {
                        delete d.user;
                    }
                    return res.send({data, total, page: post.page})
                });
            });
        })
    },

};
