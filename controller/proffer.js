const db = require('../database/mysql')

// 供应商信息
exports.proffer = async (req, res, next) => {
    let pageIndex = req.query.pageIndex == undefined?1:req.query.pageIndex
    let pageSize = req.query.pageSize == undefined?8:req.query.pageSize
    let query = [req.query.query]
    // console.log(query[0])
    if (query[0] !== '') {
         query[0] = '%' + query[0] + '%'
    }
    let params = [(pageIndex - 1) * pageSize, parseInt(pageSize)]
    let sqlList ='select * from proffer limit ?,?;' // 分页查询总数据
    let sqlTotal = 'select count(*) as total from proffer;' // 查询中数据条数
    let sqlquery = 'select * from proffer where ProfferName like ?;' // 根据商品名称模糊查询
    let sqlTotal1 = 'select count(*) as total1 from proffer where ProfferName like ?;' // 模糊查询数据条数
    try {
        let result = await db.query(sqlList, params)
        let total = await db.query(sqlTotal)
        let Query = await db.query(sqlquery, query)
        let Total1 = await db.query(sqlTotal1, query)
        let Total = total[0]['total']
        let total1 = Total1[0]['total1']
        // console.log(total1)
        if (result && result.length >= 1) {
            res.json({
                code: 200,
                data: result,
                total: Total,
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
