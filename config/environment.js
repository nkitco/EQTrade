var path = require('path');
var express = require('express');
var settings = require('./settings');
var models = require('../app/models/');
var logger = require('morgan');
var bodyParser = require('body-parser');
var jwt = require('jsonwebtoken');
var cors = require('cors');

module.exports = function (app) {
  app.use(cors());
  app.use(express.static(path.join(settings.path, 'public')));
  app.use(logger('dev'));
  // app.use(bodyParser.json());
  // app.use(bodyParser.urlencoded());
  app.use(bodyParser.urlencoded({ extended: true }));
  app.use(function (req, res, next) {
    models(function (err, db) {
      if (err) return next(err);

      req.models = db.models;
      req.db = db;

      return next();
    });
  })
  app.use((req, res, next) => {
    var token = req.body.token;
    if (token) {
      jwt.verify(token, settings.privateKey, (err, decoded) => {
        if (err) {
          // res.status(403).send({ success: false, message: "Failed to authenticate user." })
        } else {
          req.user = decoded
        }
      })
    } else {
      // res.status(403).send({ success: false, message: "No Token Provided." })
    }
    next()
  })

};
