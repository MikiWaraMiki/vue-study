module.exports = {
  devServer: {
    proxy: {
      "/api": {
        target: "https://pro-atmedia.jp/",
        pathRewrite: {'^/api' : '/api'},
        secure: false
      }
    }
  }
 }
