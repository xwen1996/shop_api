const db = require('../database/mysql')
const moment = require('moment')

// 查询库存信息
exports.outinventoryGet = async (req, res, next) => {
    let pageIndex = req.query.pageIndex == undefined?1:req.query.pageIndex
    let pageSize = req.query.pageSize == undefined?8:req.query.pageSize
    let query = [req.query.query]
    //console.log(query[0])
    if (query[0] !== '') {
         query[0] = '%' + query[0] + '%'
    }
    let parmas = [(pageIndex - 1 ) * pageSize, parseInt(pageSize)]
    //console.log(query)
    let sqlList = 'select * from product limit ?,?;' // 分页查询总数据
    let sqlTotal = 'select count(*) as total from product;'  // 查询总数据条数
    let sqlquery = 'select * from product where ProductName like ?;' // 根据商品名称模糊查询
    let sqlTotal1 = 'select count(*) as total1 from product where ProductName like ?;' // 模糊查询数据条数
    try {
        let result = await db.query(sqlList, parmas)
        let Total = await db.query(sqlTotal)
        let Query = await db.query(sqlquery, query)
        let Total1 = await db.query(sqlTotal1, query)
        let total = Total[0]['total']
        let total1 = Total1[0]['total1']
        //console.log(Total1)
        if (result && result.length >= 1) {
            res.json({
                code: 200,
                total: total,// 总数据条数，用于前端分页
                data: result,// 总数据
                query: Query, // 模糊查询数据
                total1: total1, // 模糊查询数据条数
                msg: '查询成功'
            })
        } else {
            res.json({
                code: 400,
                msg: '查询失败'
            })
        }
    } catch (error) {
        res.json({
            code: 500,
            msg: '服务器错误'
        })
    }
}
// 出售
exports.outinventoryPost = async (req, res, next) => {
    let id = req.body.id
    let sqlselectinven = 'SELECT Inventory from product where ProductID=?;'// 查询库存
    let sqlselectsell = 'SELECT Selling from product where ProductID=?;'// 查询出售数量
    let inventory = await db.query(sqlselectinven, id)
    let selling = await db.query(sqlselectsell, id)
    let inventor = inventory[0].Inventory // 当前库存
    let sell = selling[0].Selling // 当前出售数量
    // console.log(sell)
    let parmas = [
        inventor - parseInt(req.body.selling.num),
        sell + parseInt(req.body.selling.num),
        req.body.id
    ]
    // console.log(req.body.selling.PhoneNumber)
    // 会员消费
    let sqlSelectNum = 'select count(*) as number from member where PhoneNumber=?;'
    let Query = await db.query(sqlSelectNum, req.body.selling.PhoneNumber)
    let num = Query[0]['number']
    // 修改消费金额
    let sqlPrice = 'select SellingPrice as price from product where ProductID=?;' // 查询当前ID商品价格
    let Price = await db.query(sqlPrice, id) // 查询当前ID商品价格
    let price = Price[0]['price']
    let sum = price * req.body.selling.num // 当前消费金额
    if (num >= 1) {
        // 修改消费金额
        let sqlsummary = 'select Consumption as summary from member where PhoneNumber=?;' // 查询总消费金额
        let Summary = await db.query(sqlsummary, req.body.selling.PhoneNumber) // 查询总消费金额
        let summary = Summary[0]['summary'] // 之前的总消费金额
        let newSum = summary+sum  // 新的总消费金额
        let sqlupdataSum = 'update member set Consumption=? where PhoneNumber=?;'
        let param = [newSum, req.body.selling.PhoneNumber]
        db.query(sqlupdataSum, param) // 修改消费金额
        // 修改统计表
        let sqlIn = 'insert into finance (sales,date,PhoneNumber) values (?,?,?);'
        let date = [
            sum,
            moment().format("YYYY-MM-DD HH:mm:ss"),
            req.body.selling.PhoneNumber
        ]
        db.query(sqlIn, date)
        // 修改积分
        let point = sum * 10 // 当前消费积分
        let sqlpoint = 'select Integral as point from member where PhoneNumber=?;' // 查询总消费积分
        let Point = await db.query(sqlpoint, req.body.selling.PhoneNumber) // 查询总消费积分
        let points = Point[0]['point'] // 之前的总消费积分
        let newPoint = points + point  // 新的总消费积分
        let sqlupdatepoi = 'update member set Integral=? where PhoneNumber=?;'
        let para = [newPoint, req.body.selling.PhoneNumber]
        db.query(sqlupdatepoi, para)  // 修改积分
        // 修改会员等级
        console.log(newSum)
        if (newSum >= 100 && newSum < 500) {
            let sqlGrade = 'update member set MenberGrade=1 where PhoneNumber=?;' // 一级会员
            db.query(sqlGrade, req.body.selling.PhoneNumber)
        } else if (newSum >= 500 && newSum < 1000){
            let sqlGrade = 'update member set MenberGrade=2 where PhoneNumber=?;' // 二级会员
            db.query(sqlGrade, req.body.selling.PhoneNumber)
        } else if (newSum >= 1000 && newSum < 5000){
            let sqlGrade = 'update member set MenberGrade=3 where PhoneNumber=?;' // 三级会员
            db.query(sqlGrade, req.body.selling.PhoneNumber)
        } else if (newSum >= 5000 && newSum < 10000){
            let sqlGrade = 'update member set MenberGrade=4 where PhoneNumber=?;' // 四级会员
            db.query(sqlGrade, req.body.selling.PhoneNumber)
        } else if (newSum >= 10000){
            let sqlGrade = 'update member set MenberGrade=5 where PhoneNumber=?;' // 五级会员
            db.query(sqlGrade, req.body.selling.PhoneNumber)
        }
    } else if (req.body.selling.PhoneNumber != '' && num === 0) {
        return res.json({
            code: 400,
            msg: '会员号不存在'
        })
    }
    // 非会员消费
    let sqlSell = 'update product set Inventory=?,Selling=? where ProductID=?;' // 修改库存和出售数量
    if (req.body.selling.PhoneNumber == '') {
        // 非会员消费,修改统计表
        let sqlIn = 'insert into finance (sales,date) values (?,?);'
        let date = [
            sum,
            moment().format("YYYY-MM-DD HH:mm:ss"),
        ]
        db.query(sqlIn, date)
    }
    try {
        let result = await db.query(sqlSell, parmas)
        if (result.affectedRows >=1) {
            res.json({
                code: 200,
                msg: '出售成功'
            })
        } else {
            res.json({
                code: 400,
                msg: '出售失败'
            })
        }
    } catch (error) {
        res.json({
            code: 500,
            msg: '服务器错误'
        })
    }
}
// 下架
exports.outinventoryPostOut = async (req, res, next) => {
    let id = req.body.id
    let sqlselectinven = 'SELECT Inventory from product where ProductID=?;'// 查询库存
    let inventory = await db.query(sqlselectinven, id)
    let inventor = inventory[0].Inventory // 当前库存
    let outNum = req.body.outNum
    let outInventor = inventor - outNum
    let paramout = [outInventor, id]
    let sqlOut = 'update product set Inventory=? where ProductID=?;'
    try {
        let outResult = await db.query(sqlOut, paramout)
        if (outResult.affectedRows >=1) {
            res.json({
                code: 200,
                msg: '下架成功'
            })
        } else {
            res.json({
                code: 400,
                msg: '下架失败'
            })
        }
    } catch (error) {
        res.json({
            code: 500,
            msg: '服务器错误'
        })
    }
}