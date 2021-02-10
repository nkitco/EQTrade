var path = require('path');

var settings = {
  path: path.normalize(path.join(__dirname, '..')),
  port: process.env.NODE_PORT || 2657,
  privateKey: 'my private key',
  apiKey: 'sexxx',
  database: {
    protocol: "mysql", // or "mysql"
    query: { pool: true },
    host: "localhost",
    database: "trade",
    user: "root",
    password: ""
  }
};

module.exports = settings;
