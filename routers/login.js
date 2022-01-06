const express = require('express')
const loginCtrl = require('../controller/login')

const router = express.Router()

// 用户登录
router.post('/login', loginCtrl.login)

module.exports = router