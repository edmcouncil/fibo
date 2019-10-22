export default {
  data: () => ({
    timestamp: '2019Q3.1',
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
      if (typeof this.$route.params.branch === 'string') s.push(this.$route.params.branch);
      if (typeof this.$route.params.tag === 'string') s.push(this.$route.params.tag);
      return `/${s.join('/')}`;
    },
    hrefD(path, product) {
      return require('path').join(process.env.BASE_URL,
        (typeof product === 'string' ? product : this.$options.name),
        (typeof this.$route.params.branch === 'string' ? this.$route.params.branch : 'master'),
        (typeof this.$route.params.tag === 'string' ? this.$route.params.tag : 'latest'),
        (typeof path === 'string' ? path : ''));
    },
    hrefP(path, product) {
      return require('path').join(process.env.BASE_URL,
        (typeof product === 'string' ? product : this.$options.name),
        (typeof this.$route.params.branch === 'string' ? this.$route.params.branch : 'master'),
        this.timestamp,
        (typeof path === 'string' ? path : ''));
    },
  },
};
