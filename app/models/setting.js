
module.exports = function (orm, db) {
  var Setting = db.define('setting', {
    id: { type: 'serial', key: true },
    key: { type: 'text', required: true, unique: true },
    value: { type: 'text', required: true },
  });
  Setting.sync();
};
//refreshtime , profit

