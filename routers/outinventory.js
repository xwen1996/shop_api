const express = require('express')
const outinventoryCtrl = require('../controller/outinventory')

const router = express.Router()

// 出库记录
router.get('/outinventory', outinventoryCtrl.outinventoryGet)
router.post('/outinventory', outinventoryCtrl.outinventoryPost)
router.post('/outinventory/out', outinventoryCtrl.outinventoryPostOut)

module.exports = router