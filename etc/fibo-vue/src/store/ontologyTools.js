export default {
  state: {
    links: {
      quickStart: {
        production: "https://spec.edmcouncil.org/fibo/ontology/master/${timestamp}/prod.fibo-quickstart.ttl",
        development: "https://spec.edmcouncil.org/fibo/ontology/master/latest/dev.fibo-quickstart.ttl",
      },
      LoadFIBO: {
        production: "https://spec.edmcouncil.org/fibo/ontology/master/${timestamp}/LoadFIBOProd.rdf",
        development: "https://spec.edmcouncil.org/fibo/ontology/master/latest/LoadFIBODev.rdf",
      },
      rdf: {
        production: "https://spec.edmcouncil.org/fibo/ontology/master/${timestamp}/prod.rdf.zip",
        development: "https://spec.edmcouncil.org/fibo/ontology/master/latest/dev.rdf.zip",
      },
      ttl: {
        production: "https://spec.edmcouncil.org/fibo/ontology/master/${timestamp}/prod.ttl.zip",
        development: "https://spec.edmcouncil.org/fibo/ontology/master/latest/dev.ttl.zip",
      }
    },
  },
  mutations: {

  },
  actions: {

  },
  namespaced: true,
};
