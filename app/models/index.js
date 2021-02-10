var orm = require('orm');
var settings = require('../../config/settings');

var connection = null;

function setup(db, cb) {
  require('./user')(orm, db);
  require('./payments')(orm, db);
  require('./market')(orm, db);
  require('./tokens')(orm, db);
  require('./order')(orm, db);
  require('./setting')(orm, db);
  require('./chat')(orm, db);
  require('./video')(orm, db);
  require('./admin')(orm, db);
  // db.sync();
  return cb(null, db);
}

module.exports = function (cb) {
  if (connection) return cb(null, connection);

  orm.connect(settings.database, function (err, db) {
    if (err) return cb(err);

    connection = db;
    db.settings.set('instance.returnAllErrors', true);
    setup(db, cb);
  });
};
