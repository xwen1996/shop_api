const express = require('express')
const staffCtrl = require('../controller/staff')

const router = express.Router()

// 员工信息
router.get('/staff', staffCtrl.staff)
router.post('/staff/add', staffCtrl.staffAdd)

module.exports = router