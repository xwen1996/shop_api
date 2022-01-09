const express = require('express')
const financeCtrl = require('../controller/finance')

const router = express.Router()

// 员工信息
router.get('/finance', financeCtrl.finance)

module.exports = router