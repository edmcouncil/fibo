export default {
  state: {
    links: {
      quickStart: {
        production: "/fibo/ontology/master/${timestamp}/prod.fibo-quickstart.ttl",
        development: "/fibo/ontology/master/latest/dev.fibo-quickstart.ttl",
      },
      LoadFIBO: {
        production: "/fibo/ontology/master/${timestamp}/LoadFIBOProd.rdf",
        development: "/fibo/ontology/master/latest/LoadFIBODev.rdf",
      },
      rdf: {
        production: "/fibo/ontology/master/${timestamp}/prod.rdf.zip",
        development: "/fibo/ontology/master/latest/dev.rdf.zip",
      },
      ttl: {
        production: "/fibo/ontology/master/${timestamp}/prod.ttl.zip",
        development: "/fibo/ontology/master/latest/dev.ttl.zip",
      }
    },
  },
  mutations: {

  },
  actions: {

  },
  namespaced: true,
};
