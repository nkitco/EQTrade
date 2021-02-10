var _ = require('lodash');
var request = require('request');

var base = 'https://finnhub.io/api/v1/';

module.exports = {
    history: function (req, res, next) {
        let params = _.pick(req.body, 'url');

        request(base + params.url, function (error, response, body) {
            return res.send(body);
        });

    },
    historyTradingView: function (req, res, next) {

        let canddleUrl = null;

        console.log('resolution :',req.query.resolution)

        if (req.query.type == 'forex') {
            canddleUrl = `${req.query.type}/candle?symbol=${req.query.e + ':' + req.query.fsym + '_' + req.query.tsym}&resolution=${req.query.resolution}&count=${req.query.limit}&token=${req.query.token}`;
        } else if (req.query.type == 'crypto') {
            canddleUrl = `${req.query.type}/candle?symbol=${req.query.e + ':' + req.query.fsym + req.query.tsym}&resolution=${req.query.resolution}&count=${req.query.limit}&token=${req.query.token}`;
        } else if (req.query.type == 'stock') {
            canddleUrl = `${req.query.type}/candle?symbol=${req.query.fsym }&resolution=${req.query.resolution}&count=${req.query.limit}&token=${req.query.token}`;
        }

        console.log(base + canddleUrl)
        request(base + canddleUrl, function (error, response, body) {
            //console.log('mna',body)
            return res.send(JSON.parse(body));
        });
    },
};
