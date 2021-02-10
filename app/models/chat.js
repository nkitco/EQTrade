
module.exports = function (orm, db) {
  var Chat = db.define('chat', {
    id: { type: 'serial', key: true },
    text: String,
    status: ["from", "to"],
    seen: Boolean,
    time: { type: 'date', time: true },
  },
    {
      hooks: {
        beforeCreate: function () {
          this.time = new Date();
          this.seen = false;
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
  Chat.hasOne('user', db.models.user, { required: true, autoFetch: true, reverse: 'chat' });
  Chat.sync();
};
