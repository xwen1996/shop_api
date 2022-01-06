const db = require('../database/mysql')

// 系统用户注册
exports.system = async (req, res, next) => {
    let params = [
        req.body.UserName,
        req.body.PassWord
    ]
    let sqlRegister = 'insert into user (UserName,PassWord)values (?,?);'
    let sqlSelect = 'select count(*) as number from user where UserName=?;'
    let Query = await db.query(sqlSelect, req.body.UserName)
    let num = Query[0]['number']
    console.log(num)
    if (num >= 1) {
        res.json({
            code: 400,
            msg: '注册失败,用户名已存在!'
        })
    } else{
        try {
            let result = await db.query(sqlRegister, params)
            console.log(result.affectedRows)
            if (result.affectedRows >=1) {
                res.json({
                    code: 200,
                    msg: '注册成功'
                })
            } else {
                res.json({
                    code: 400,
                    msg: '注册失败'
                })
            }
        } catch (err) {
            res.json({
                code: 500,
                msg: '注册失败，服务器错误'
            })
            next(err)
        }}
}