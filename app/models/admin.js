
module.exports = function (orm, db) {
  var Admin = db.define('admin', {
    id: { type: 'serial', key: true },
    name: { type: 'text', required: true },
    username: { type: 'text', required: true },
    password: { type: 'text', required: true },
  });
  Admin.sync();
};
//refreshtime , profit
