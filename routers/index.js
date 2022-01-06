const express = require('express')

const router = express.Router()

// 用户登录
router.use(require('./login'))
// 库存信息
router.use(require('./inventory'))
// 商品入库
router.use(require('./ininventory'))
// 出库记录
router.use(require('./outinventory'))
// 会员管理
router.use(require('./member'))
// 供应商管理
router.use(require('./proffer'))
// 员工管理
router.use(require('./staff'))
// 系统管理
router.use(require('./system'))

module.exports = router