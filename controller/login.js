const db = require('../database/mysql')
const jwt = require('../util/jwt')
// 用户登录
exports.login = async (req, res, next) => {
    let sql = 'select * from user where UserName=? and PassWord=?;'
    let params = [
        req.body.username,
        req.body.password
    ]
    try {
        let result = await db.query(sql, params)
        if (result && result.length >= 1) {
            res.json({
                code: 200,
                msg:'登录成功',
                data: result,
                token: jwt.createToken(result)
                })
        } else {
            res.json({
                code: 400,
                msg:'登录失败! 用户名或密码错误'
                })
        }
    } catch (error) {
        res.json({
            code: 500,
            msg:'登录失败，服务器错误',
            error
            })
    }
}