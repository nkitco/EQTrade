var _ = require('lodash');
var request = require('request');
var cryptoUrl = 'https://finnhub.io/api/v1/crypto/symbol?exchange=binance&token=bmlk6r7rh5rb2pv98jqg';
var forexUrl = 'https://finnhub.io/api/v1/forex/symbol?exchange=oanda&token=bmlk6r7rh5rb2pv98jqg';
var stockUrl = 'https://www.nasdaq.com/api/v1/screener?page=2&pageSize=20';
module.exports = {
    new: function (req, res, next) {
        let { type } = req.params;
        if (type == 'crypto') {
            request(cryptoUrl, function (error, response, body) {
                body = JSON.parse(body);
                let data = [];
                let item;

                if (typeof body == 'object') {
                    for (item of body) {
                        data.push({
                            type: 'crypto',
                            symbol: item.symbol,
                            display: item.displaySymbol,
                            description: item.description.replace('Binance ', '')
                        });
                    }
                    req.models.market.create(data);
                    return res.send(data);
                }
            });
        }
        else if (type == 'forex') {
            request(forexUrl, function (error, response, body) {
                body = JSON.parse(body);
                let data = [];
                let item;
                if (typeof body == 'object') {
                    for (item of body) {
                        data.push({
                            type: 'forex',
                            symbol: item.symbol,
                            display: item.displaySymbol.replace(/[0-9]/g, ''),
                            description: item.description.replace('FXPIG ', '').replace('.spa', '').replace('.sfl', '').replace('.mpa', '')
                        });
                    }
                    req.models.market.create(data);
                    return res.send(data);
                }
            });
        }
        else if (type == 'stock') {
            request(stockUrl, function (error, response, body) {
                body = JSON.parse(body);
                let data = [];
                let item;
                if (typeof body == 'object') {
                    for (item of body.data) {
                        data.push({
                            type: 'stock',
                            symbol: item.ticker,
                            display: item.company,
                            description: item.sectorName
                        });
                    }
                    req.models.market.create(data);
                    return res.send(data);
                }
            });
        }
    },
    list: function (req, res, next) {
        let { type } = req.params;

        req.models.market.find({ type }, function (err, markets) {
            let data = {};
            console.log('err',err)
            console.log('amk',markets)
            if(!markets)return res.send([])
            for (let market of markets) {
                delete market.order;
            }
            data[type] = markets;
            return res.send(data)
        });
    }
};
