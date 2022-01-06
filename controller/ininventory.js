const db = require('../database/mysql')

// 商品入库
exports.ininventory = async (req, res, next) => {
    let params = [
        req.body.ProductName,
        req.body.Brand,
        req.body.Class,
        req.body.Specification,
        req.body.ShelfLife,
        req.body.ExpiryDate,
        req.body.PurchasingPrice,
        req.body.SellingPrice,
        req.body.Inventory
    ]
    console.log(params)
    let sqlIntu = 'insert into product (ProductName,Brand,Class,Specification,ShelfLife,ExpiryDate,PurchasingPrice,SellingPrice,Inventory)values (?,?,?,?,?,?,?,?,?);'
    try {
        let result = await db.query(sqlIntu, params)
        console.log(result.affectedRows)
        if (result.affectedRows >=1) {
            res.json({
                code: 200,
                msg: '添加成功'
            })
        } else {
            res.json({
                code: 400,
                msg: '添加失败，数据格式错误'
            })
        }
    } catch (err) {
        res.json({
            code: 500,
            msg: '添加失败，服务器错误'
        })
        next(err)
    }
}