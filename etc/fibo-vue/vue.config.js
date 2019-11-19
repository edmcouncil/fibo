process.env.VUE_APP_TIMESTAMP = '2019Q3.1'
module.exports = {
  publicPath: '/' + (process.env.ONTPUB_FAMILY || 'fibo') + '/',
  assetsDir: process.env.product_branch_tag || 'htmlpages/master/latest',
  indexPath: (process.env.product_branch_tag || 'htmlpages/master/latest') + '/index.html',
  css: {
    loaderOptions: {
      sass: {
        data: '@import "@/styles/global.scss";',
      },
    },
  },
  runtimeCompiler: true,
  devServer: {
    proxy: {
      '^/search/json$': {
        target: 'http://172.30.1.116:9000'
      },
      '^/module/json$': {
        target: 'http://172.30.1.116:9000'
      },
    }
  },
};
