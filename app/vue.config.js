module.exports = {
  devServer: {
    proxy: {
      "/api": {
        target: "https://localhost:3000",
        pathRewrite: {'^/api' : '/api'},
        secure: false
      }
    }
  }
}
