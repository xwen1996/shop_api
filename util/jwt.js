const jwt = require('jwt-simple')

// 获取 token
exports.createToken = (data) => {
    return jwt.encode({
        exp: Date.now() + (1000 * 60 * 60 * 24),
        info: data
    },require('../config/tokenKey').tokenKey)
}