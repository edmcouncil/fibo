module.exports = {
  publicPath: '/fibo/',
  css: {
    loaderOptions: {
      sass: {
        data: '@import "@/styles/global.scss";',
      },
    },
  },
};
