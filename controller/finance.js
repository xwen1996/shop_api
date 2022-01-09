const db = require('../database/mysql')

// 财务统计
exports.finance = async (req, res, next) => {
    let years = req.query.year
    let yearsLike = [
        years + '-01%',
        years + '-02%',
        years + '-03%',
        years + '-04%',
        years + '-05%',
        years + '-06%',
        years + '-07%',
        years + '-08%',
        years + '-09%',
        years + '-10%',
        years + '-11%',
        years + '-12%'
    ]
    console.log(yearsLike)
    let sqlSelect = 'select sum(sales) sales from finance where date like ?;'
    try {
        let result1 = await db.query(sqlSelect, yearsLike[0])
        let result2 = await db.query(sqlSelect, yearsLike[1])
        let result3 = await db.query(sqlSelect, yearsLike[2])
        let result4 = await db.query(sqlSelect, yearsLike[3])
        let result5 = await db.query(sqlSelect, yearsLike[4])
        let result6 = await db.query(sqlSelect, yearsLike[5])
        let result7 = await db.query(sqlSelect, yearsLike[6])
        let result8 = await db.query(sqlSelect, yearsLike[7])
        let result9 = await db.query(sqlSelect, yearsLike[8])
        let result10 = await db.query(sqlSelect, yearsLike[9])
        let result11 = await db.query(sqlSelect, yearsLike[10])
        let result12 = await db.query(sqlSelect, yearsLike[11])
        let sales =[ 
            result1[0]['sales'],
            result2[0]['sales'],
            result3[0]['sales'],
            result4[0]['sales'],
            result5[0]['sales'],
            result6[0]['sales'],
            result7[0]['sales'],
            result8[0]['sales'],
            result9[0]['sales'],
            result10[0]['sales'],
            result11[0]['sales'],
            result12[0]['sales']
        ]
        if (sales) {
            res.json({
                code: 200,
                sales: sales,
                msg: '数据获取成功'
            })
        } else {
            res.json({
                code: 400,
                msg: '数据获取失败'
            })
        }
    } catch (err) {
        res.json({
            code: 500,
            msg: '数据获取失败，服务器错误'
        })
        next(err)
    }
}