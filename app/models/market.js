module.exports = function (orm, db) {
    var Market = db.define('market', {
            id: {type: 'serial', key: true},
            type: ["stock", "forex", "crypto"],
            symbol: String,
            display: String,
            description: String,
        },
        {
            methods: {
                serialize: function () {
                    return {
                        id: this.id,
                        type: this.type,
                        symbol: this.symbol,
                        display: this.display,
                        description: this.description,
                    };
                }
            }
        });
    Market.sync();
};
