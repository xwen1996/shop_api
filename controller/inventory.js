const db = require('../database/mysql')

// 库存信息
exports.inventory = async (req, res, next) => {
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
// 上架
exports.inventoryAdd = async (req, res, next) => {
    let id = req.body.id
    let sqlselectinven = 'SELECT Inventory from product where ProductID=?;'// 查询库存
    let inventory = await db.query(sqlselectinven, id)
    let inventor = inventory[0].Inventory // 当前库存
    let addNum = req.body.add.Inventory  // 要上架的数量
    let addInventor = inventor + parseInt(addNum)
    let paramadd = [addInventor, id]
    console.log(addNum)
    let sqlAdd = 'update product set Inventory=? where ProductID=?;'
    try {
        let outResult = await db.query(sqlAdd, paramadd)
        if (outResult.affectedRows >=1) {
            res.json({
                code: 200,
                msg: '上架成功'
            })
        } else {
            res.json({
                code: 400,
                msg: '上架失败'
            })
        }
    } catch (error) {
        res.json({
            code: 500,
            msg: '上架失败，服务器错误'
        })
    }
}