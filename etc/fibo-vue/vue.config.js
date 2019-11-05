process.env.VUE_APP_TIMESTAMP = '2019Q3.1'
process.env.VUE_APP_BRANCH    = process.env.product_branch_tag.split('/',3)[1] || 'master'
process.env.VUE_APP_TAG       = process.env.product_branch_tag.split('/',3)[2] || 'latest'

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
};