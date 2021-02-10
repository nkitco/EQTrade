module.exports = function (orm, db) {
    var Order = db.define('order', {
            id: {type: 'serial', key: true},
            balanceType: ["real", "practice"],
            tradeType: ["buy", "sell"],
            rType: ["trade", "binary"],
            price: Number,
            point: {type: 'integer'},
            tradeAt: {type: 'integer'},
            status: ["pending", "done"],
            result: ["win", "lose"],
            bet: Number,
            profit: Number,
            amount: Number,
            time: {type: 'date', time: true},
        },
        {
            hooks: {
                beforeCreate: function () {
                    this.time = new Date();
                    this.status = 'pending';
                    this.result = 'lose';
                }
            },
        },
        {
            methods: {
                serialize: function () {
                    return {
                        id: this.id,
                    };
                }
            }
        });
    Order.hasOne('user', db.models.user, {required: true, autoFetch: true, reverse: 'order'});
    Order.hasOne('market', db.models.market, {required: true, autoFetch: true, reverse: 'order'});
    Order.sync();
};
