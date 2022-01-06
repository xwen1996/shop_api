const express = require('express')
const memberCtrl = require('../controller/member')

const router = express.Router()

// 会员信息
router.get('/member', memberCtrl.member)

module.exports = router