const express = require('express')
const inventouCtrl = require('../controller/ininventory')

const router = express.Router()

// 商品入库
router.post('/ininventory', inventouCtrl.ininventory)

module.exports = router