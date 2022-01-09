const express = require('express')
const memberCtrl = require('../controller/member')

const router = express.Router()

// 会员信息
router.get('/member', memberCtrl.member)
// 注册会员
router.post('/member/register', memberCtrl.memberRegister)

module.exports = router