const express = require('express')
const inventouCtrl = require('../controller/inventory')

const router = express.Router()

// 库存信息
router.get('/inventory', inventouCtrl.inventory)

module.exports = router