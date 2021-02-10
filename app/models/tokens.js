
module.exports = function (orm, db) {
  var Tokens = db.define('tokens', {
    id: { type: 'serial', key: true },
    token: { type: 'text', required: true, unique: true },
  });
  Tokens.sync();
};
