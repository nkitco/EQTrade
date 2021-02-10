var _ = require('lodash');
var md5 = require('md5');
var nodemailer = require('nodemailer');
var helpers = require('./_helpers');
var jwt = require('jsonwebtoken');
var settings = require('../../config/settings');
var request = require('request');
var keyLib = require('@owstack/key-lib');

module.exports = {
    usernameCheck: function (req, res, next) {
        let username = _.pick(req.body, 'username');
        req.models.user.exists(username, function (err, exists) {
            if (!exists) {
                res.send({ success: true, message: "usernameIsFree" })
            }
            else {
                res.send({ success: false, message: "usernameIsInUse" })
            }
        });

    },
    emailCheck: function (req, res, next) {
        let email = _.pick(req.body, 'email');
        req.models.user.exists(email, function (err, exists) {
            if (!exists) {
                res.send({ success: true, message: "emailIsFree" })
            }
            else {
                res.send({ success: false, message: "emailIsInUse" })
            }
        });

    },
    emailUpdate: function (req, res, next) {
        let params = _.pick(req.body, 'password', 'email');

        req.models.user.get(req.user.id, function (err, user) {
            if (err) {
                res.send({ success: false, message: "updateError" })
            }
            if (user.password == md5(params.password)) {
                user.email = params.email;
                user.save(function (err) {
                    if (err) {
                        res.send({ success: false, message: "updateError" })
                    }
                    else {
                        res.send({ success: true, message: "updateSuccess" })
                    }
                });
            }
            else {
                res.send({ success: false, message: "wrongPassword" })
            }
        });
    },
    passwordUpdate: function (req, res, next) {
        let params = _.pick(req.body, 'password', 'newPass');
        req.models.user.get(req.user.id, function (err, user) {
            if (err) {
                res.send({ success: false, message: "updateError" })
            }
            if (user.password == md5(params.password)) {
                user.password = md5(params.newPass);
                user.save(function (err) {
                    if (err) {
                        res.send({ success: false, message: "updateError" })
                    }
                    else {
                        res.send({ success: true, message: "updateSuccess" })
                    }
                });
            }
            else {
                res.send({ success: false, message: "wrongPassword" })
            }
        });
    },
    delete: function (req, res, next) {
        let params = _.pick(req.body, 'password');
        req.models.user.get(req.user.id, function (err, user) {
            if (err) {
                res.send({ success: false, message: "updateError" })
            }
            if (user.password == md5(params.password)) {
                user.status = 0;
                user.save(function (err) {
                    if (err) {
                        res.send({ success: false, message: "updateError" })
                    }
                    else {
                        res.send({ success: true, message: "updateSuccess" })
                    }
                });
            }
            else {
                res.send({ success: false, message: "wrongPassword" })
            }
        });
    },
    add: function (req, res, next) {
        let params = _.pick(req.body, 'username', 'password', 'email', 'mobile');
        req.models.user.create(params, function (err, user) {
            if (err) {
                if (Array.isArray(err)) {
                    return res.send({ success: false, errors: helpers.formatErrors(err) });
                } else {
                    return next(err);
                }
            }
            let token = jwt.sign({ id: user.id }, settings.privateKey);
            req.models.user.get(user.id, function (err, newUser) {
                newUser.token = token;
                newUser.password = md5(user.password);
                newUser.save();
                return res.send({ success: true, data: newUser.serialize() });
            });
        });

    },
    login: function (req, res, next) {
        // var transporter = nodemailer.createTransport({
        //     service: 'gmail',
        //     host: 'smtp.gmail.com',
        //     port: 465,
        //     secure: true,
        //     auth: {
        //         user: 'rod.hapii@gmail.com',
        //         pass: 'aA147852369'
        //     }
        // });
        // const mailOptions = {
        //     from: 'Bitbaz <bitbaz@email.com>', // sender address
        //     to: '30avash.une30@gmail.com', // list of receivers
        //     subject: 'Subject of your email', // Subject line
        //     html: '<p>Your html here</p>'// plain text body
        // };
        // transporter.sendMail(mailOptions, function (err, info) {
        //     if (err)
        //         console.log(err)
        //     else
        //         console.log(info);
        // });

        let params = _.pick(req.body, 'username', 'password');
        params.password = md5(params.password);
        req.models.user.find({ ...params, status: true }, function (err, user) {
            if (user.length > 0) {
                // user[0].lastSeen = new Date();
                // user[0].save();
                console.log(user[0].username)
                res.send({ success: true, data: user[0].serialize() })
            }
            else {
                res.send({ success: false, message: "loginFailed" })
            }
        })
    }
};
