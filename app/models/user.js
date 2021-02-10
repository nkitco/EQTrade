
module.exports = function (orm, db) {
  var User = db.define('user', {
    id: { type: 'serial', key: true },
    id: { type: 'serial', key: true },
    username: { type: 'text', required: true, unique: true },
    password: { type: 'text', required: true },
    email: { type: 'text', required: true, unique: true },
    mobile: { type: 'text' },
    realBalance: Number,
    practiceBalance: Number,
    joinedAt: { type: 'date', time: true },
    lastSeen: { type: 'date', time: true },
    status: Boolean,
    token: String
  },
    {
      hooks: {
        beforeCreate: function () {
          this.joinedAt = new Date();
          this.lastSeen = new Date();
          this.status = true;
          this.realBalance = 0;
          this.practiceBalance = 100;
        }
      },
      validations: {
        username: [
          orm.enforce.ranges.length(4, undefined, 'usernameIsShort'),
          orm.enforce.unique("usernameIsInUse")
        ],
        email: [
          orm.enforce.patterns.email("emailIsInvalid"),
          orm.enforce.unique("emailIsInUse")
        ],
        password: [
          orm.enforce.ranges.length(8, undefined, 'passwordIsShort')
        ],
      },
      methods: {
        serialize: function () {
          return {
            username: this.username,
            balance: {
              real: this.realBalance,
              practice: this.practiceBalance,
            },
            token: this.token,
          };
        }
        ,
        toString: function () {
          return {
            id: this.id,
            username: this.username,
          };
        }
      }
    });
  User.sync();
};
