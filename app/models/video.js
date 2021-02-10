
module.exports = function (orm, db) {
  var Video = db.define('video', {
    id: { type: 'serial', key: true },
    title: { type: 'text', required: true },
    image: { type: 'text', required: true },
    link: { type: 'text', required: true },
    view: { type: 'integer' },
  });
  Video.sync();
};
//refreshtime , profit
