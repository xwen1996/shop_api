const express = require('express')
const systemCtrl = require('../controller/system')

const router = express.Router()

// 系统用户注册
router.post('/system/register', systemCtrl.system)

module.exports = router