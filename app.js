const express = require('express')
const morgan = require('morgan')
const cors = require('cors')
const router = require('./routers')
const errorHandler = require('./middleware/error-handle')

const app = express()

const PORT = process.env.PORT || 3000
// 打印日志
app.use(morgan('dev'))
// 允许跨域请求
app.use(cors())

// 配置解析表单请求体
app.use(express.json())
app.use(express.urlencoded({extended:false}))

// 挂载路由
app.use('/api', router)

// 挂载统一处理服务端错误处理中间件
app.use(errorHandler())

app.listen(PORT, ()=>{
    console.log('server running at http://localhost:3000/')
})