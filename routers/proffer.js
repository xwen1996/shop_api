const express = require('express')
const profferCtrl = require('../controller/proffer')

const router = express.Router()

// 供应商信息
router.get('/proffer', profferCtrl.proffer)
router.post('/proffer/add', profferCtrl.profferAdd)
router.post('/proffer/delete', profferCtrl.profferDelete)

module.exports = router