export default {
  data: () => ({
    timestamp:  process.env.VUE_APP_TIMESTAMP,
    branch:     process.env.VUE_APP_BRANCH,
    tag:        process.env.VUE_APP_TAG,
  }),
  mutations: {

  },
  actions: {

  },
  namespaced: true,
  methods: {
    router(product) {
      const s = [];
      if (typeof product === 'string') s.push(product);
      return `/${s.join('/')}${typeof this.$route.query.tag === 'string' ? `?tag=${this.$route.query.tag}` : ''}`;
    },
    hrefD(path, product) {
      return require('path').join(process.env.BASE_URL,
        (typeof product	=== 'string' ? product : this.$options.name),
        this.branch,
        (typeof this.$route.query.tag === 'string' ? this.$route.query.tag : this.tag),
        (typeof path	=== 'string' ? path : ''));
    },
    hrefP(path, product, addBaseUrl = true) {
      return require('path').join((addBaseUrl ? process.env.BASE_URL : ""),
        (typeof product	=== 'string' ? product : this.$options.name),
        this.branch,
        this.timestamp,
        (typeof path	=== 'string' ? path : ''));
    },
  },
};
