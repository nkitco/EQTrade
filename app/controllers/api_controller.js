var _ = require('lodash');
var settings = require('../../config/settings');
var base = 'https://finnhub.io/api/v1/';
var request = require('request');

module.exports = {
    apiModifier: function (req, res, next) {
        let {type} = req.params;
        let {apiKey, token} = req.body;
        if (apiKey != settings.apiKey) {
            return res.send({error: 'apiKey is invalid'});
        }
        else if (type == 'info') {
            req.models.user.one({token}, function (err, user) {
                if (user == null)
                    res.send({error: 'user not found!'})
                delete user.order;
                delete user.chat;
                res.send(user)
            })

        }
        else if (type == 'withdraw') {
            let {amount, description} = req.body;
            req.models.user.one({token}, function (err, user) {
                if (user == null)
                    res.send({error: 'user not found!'});
                user.realBalance = parseInt(user.realBalance) - parseInt(amount);
                user.save();
                req.models.withdraw.create({
                    amount,
                    description,
                    user_id: user.id
                }, function (err, withdraw) {
                    if (err) {
                        return res.send({error: err});
                    }
                    return res.send({success: true});
                });
            })

        }
        else if (type == 'deposit') {
            let {amount, description} = req.body;
            req.models.user.one({token}, function (err, user) {
                if (user == null)
                    res.send({error: 'user not found!'});
                user.realBalance = parseInt(user.realBalance) + parseInt(amount);
                user.save();
                req.models.deposit.create({
                    amount,
                    description,
                    user_id: user.id
                }, function (err, deposit) {
                    if (err) {
                        return res.send({error: err});
                    }
                    return res.send({success: true});
                });
            })

        }
        else if (type == 'shetabDeposit') {
            let {amount, description} = req.body;
            req.models.user.one({token}, function (err, user) {
                if (user == null)
                    res.send({error: 'user not found!'});
                user.realBalance = parseInt(user.realBalance) + parseInt(amount);
                user.save();
                req.models.deposit.create({
                    amount,
                    description,
                    user_id: user.id
                }, function (err, deposit) {
                    if (err) {
                        return res.send({error: err});
                    }
                    return res.send({success: true});
                });
            })

        }
        else {
            res.send({error: 'method not found'})
        }
    },
    apiCashModifier: async function (req, res, next) {
        let {type} = req.params;
        if (type == 'deposit') {
            req.models.user.find({token: req.body.token}, 1, function (err, user) {
                if (err) {
                    res.send({success: false, message: "updateError"})
                }
                req.models.payments.create({
                    type: req.body.type,
                    amount: req.body.amount,
                    description: req.body.description,
                    ref: req.body.ref,
                    origin: req.body.cardNo,
                    user_id: user[0].id,
                    time: Math.round((new Date()).getTime() / 1000)
                }, function (err, items) {
                    console.log('err ', err)
                    user[0].save();
                    res.send(true)
                });
            });
        }else if (type == 'withdraw') {
            req.models.user.find({token: req.body.token}, 1, function (err, user) {
                if (err) {
                    res.send({success: false, message: "updateError"})
                }
                req.models.payments.create({
                    type: req.body.type,
                    amount: req.body.amount,
                    description: req.body.description,
                    ref: req.body.ref,
                    origin: req.body.cardNo,
                    user_id: user[0].id,
                    time:Math.round((new Date()).getTime() / 1000)
                }, function (err, items) {
                    console.log('err ', err)
                    user[0].save();
                    res.send(true)
                });
            });
        }
    },
    getApiToken: async function (req, res, next) {
        let item;
        let AllToken = [];
        req.models.tokens.find().all(async (err, tokens) => {
            if (err) return next(err);
            //console.log('tokens',tokens)
            for (item of tokens) {
                //console.log(item.token)
                AllToken.push(item.token);
            }
            res.send(AllToken)
        })

    },
    getLastPrice: async function (req, res, next) {

        let candleUrl;
        if (req.query.type == 'forex') {
            candleUrl = `${req.query.type}/candle?symbol=${req.query.e + ':' + req.query.fsym + '_' + req.query.tsym}&resolution=${req.query.resolution}&count=1&token=${req.query.token}`;
        } else if (req.query.type == 'crypto') {
            candleUrl = `${req.query.type}/candle?symbol=${req.query.e + ':' + req.query.fsym + req.query.tsym}&resolution=${req.query.resolution}&count=1&token=${req.query.token}`;
        } else if (req.query.type == 'stock') {
            candleUrl = `${req.query.type}/candle?symbol=${req.query.fsym }&resolution=${req.query.resolution}&count=1&token=${req.query.token}`;
        }
        console.log('url', base + candleUrl)
        request(base + candleUrl, function (error, response, body) {
            console.log('mna', body)
            return res.send(JSON.parse(body));
        });
    },
    getPaymentInfo: async function (req, res, next) {
        req.models.setting.find().all([{key: "PAYEE_NAME"}, {key: "PAYEE_ACCOUNT"}], function (err, settings) {
            res.send(settings)
        });
    },
    errorPM: async function (req, res, next) {
        res.redirect(req.body.callback_website + '/?pm=false');
    },
    verifyPM: async function (req, res, next) {
        //console.log('req', req.body)

        req.models.user.find({token: req.body.token}, 1, function (err, user) {
            if (err) {
                res.send({success: false, message: "updateError"})
            }
            user[0].realBalance += parseFloat(req.body.amount)
            req.models.payments.create({
                amount: req.body.amount,
                description: "perfect Money",
                user_id: user[0].id
            }, function (err, items) {
                console.log('err ', err)
                user[0].save();
                res.redirect(req.body.callback_website + '/?pm=true');
            });
        });
    }
};
