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
};
