var _ = require('lodash');
//var settings = require('../../config/settings');
//var coinbase = require('coinbase-commerce-node');
//var Client = coinbase.Client;
//var Charge = coinbase.resources.Charge;

//Client.init(settings.coinbaseApiKey);

module.exports = function (req, res, next) {
    let { type } = req.params;
    if (type == 'hook') {
        let data = {};
        let payload = req.body.event;
        let BaseType = payload.type;
        data.payId = payload.id;

        if (BaseType == 'charge:pending') {
            data.status = 'pending';
            data.type = payload.payments[0].network
            data.amount = payload.payments[0].value.crypto.amount;
            data.price = payload.payments[0].value.local.amount;
            data.payCode = payload.code;
            data.time = payload.created_at;
            data.user_id = payload.metadata.user_id;

            req.models.deposit.create(data, function (err, user) {
                if (err) {
                    return res.send({ error: true });
                }
                else {
                    return res.send({ success: true });
                }
            });
        }
        else if (BaseType == 'charge:failed') {
            req.models.deposit.find({ payId: data.payId }).all((err, diposits) => {
                if (err) {

                } else if (diposits.length > 0) {
                    diposits[0].status = 'canceled';
                    diposits[0].save();
                }

            });
        }
        else if (BaseType == 'charge:confirmed') {
            req.models.deposit.find({ payId: data.payId }).all((err, diposits) => {
                if (err) {

                } else if (diposits.length > 0) {
                    diposits[0].status = 'done';
                    diposits[0].save();
                }

            });

        }

    }
    if (type == 'deposit') {
        req.models.payment.find().all((err, data) => {
            if (err) {
                return res.send({ error: true });
            }
            return res.send({ success: true, data });
        });
        // var firstChargeObj = new Charge({
        //     "description": "from trade app",
        //     "metadata": {
        //         "user_id": req.user.id,
        //     },
        //     "name": "deposit to trade",
        //     "pricing_type": "no_price"
        // });
        // firstChargeObj.save(function (error, response) {
        //     if (error == null) {
        //         return res.send(response)
        //     }
        //     return res.send({ error: true });
        //     // if (response && response.id) {
        //     // Charge.retrieve(response.id, function (error, response) {
        //     //     console.log('Retrived charge(callback)');
        //     //     console.log(response);
        //     //     console.log(error);
        //     // });
        //     // }
        // });
    }
    if (type == 'withdraw') {
        let params = _.pick(req.body, 'type', 'address', 'price');
        params.price = parseFloat(params.price);
        if (isNaN(params.price) || params.address == '') {
            return res.send({ empty: true });
        }
        req.models.user.get(req.user.id, function (err, user) {
            if (err) {
                return res.send({ error: true });
            }
            if (user.realBalance < params.price) {
                return res.send({ balance: true });
            }
            else {
                req.models.withdraw.create({ ...params, user_id: user.id, }, function (err, user) {
                    if (err) {
                        return res.send({ error: true });
                    }
                    else {
                        return res.send({ success: true });
                    }
                });
            }
        });
    }
    else if (type == 'depositHistory') {
        req.models.deposit.find({ user_id: req.user.id }).order('-id').all((err, diposits) => {
            if (err) {
                return res.send({ error: true });
            } else {
                return res.send({ success: true, data: diposits });
            }

        });
    }
    else if (type == 'withdrawHistory') {
        req.models.withdraw.find({ user_id: req.user.id }).order('-id').all((err, withdraws) => {
            if (err) {
                return res.send({ error: true });
            } else {
                return res.send({ success: true, data: withdraws });
            }

        });
    }

};
