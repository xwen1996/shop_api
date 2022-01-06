const db = require('../database/mysql')

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
    console.log(sell)
    let parmas = [
        inventor - parseInt(req.body.selling),
        sell + parseInt(req.body.selling),
        req.body.id
    ]
    console.log(parmas)
    let sqlSell = 'update product set Inventory=?,Selling=? where ProductID=?;' // 修改库存和出售数量
    try {
        let result = await db.query(sqlSell, parmas)
        console.log(result)
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