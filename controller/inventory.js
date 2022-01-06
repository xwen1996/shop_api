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