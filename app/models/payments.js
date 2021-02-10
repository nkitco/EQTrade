module.exports = function (orm, db) {
    var Payments = db.define('payments', {
            id: {type: 'serial', key: true},
            amount: Number,
            description: {type: 'text'},
            type: ["deposit", "withdraw"],
            origin: String,
            ref: String,
            status: ["pending", "done", "failed"],
            time: {type: 'date', time: true},
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
    Payments.hasOne('user', db.models.user, {required: true, autoFetch: true, reverse: 'payments'});

    Payments.sync();
};
