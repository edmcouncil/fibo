export default {
  state: {
    serializations: [
      {
        name: 'FIBO (Production) (zip)',
        xml: [{
          name: 'prod.rdf.zip',
          PRODUCT: 'ontology',
        }],
        ttl: [{
          name: 'prod.ttl.zip',
          PRODUCT: 'ontology',
        }],
        json: [{
          name: 'prod.jsonld.zip',
          PRODUCT: 'ontology',
        }],
        nq: [
          {
            name: 'prod.fibo.nq',
            PRODUCT: 'ontology',
          },
          {
            name: 'prod.fibo.nq.zip',
            PRODUCT: 'ontology',
          },
        ],
      },
      {
        name: 'FIBO (Development) (zip)',
        xml: [{
          name: 'dev.rdf.zip',
          product: 'ontology',
        }],
        ttl: [{
          name: 'dev.ttl.zip',
          product: 'ontology',
        }],
        json: [{
          name: 'dev.jsonld.zip',
          product: 'ontology',
        }],
        nq: [
          {
            name: 'dev.fibo.nq',
            product: 'ontology',
          },
          {
            name: 'dev.fibo.nq.zip',
            product: 'ontology',
          },
        ],
      },
      {
        name: 'FIBO (Production)',
        link: {
          name: 'follow your nose starting point',
          url: 'http://patterns.dataincubator.org/book/follow-your-nose.html',
        },
        xml: [{
          name: 'LoadFIBOProd.rdf',
          PRODUCT: 'ontology',
        }],
        ttl: [{
          name: 'LoadFIBOProd.ttl',
          PRODUCT: 'ontology',
        }],
        json: [{
          name: 'LoadFIBOProd.jsonld',
          PRODUCT: 'ontology',
        }],
        nq: [
        ],
      },
      {
        name: 'FIBO (Development)',
        link: {
          name: 'follow your nose starting point',
          url: 'http://patterns.dataincubator.org/book/follow-your-nose.html',
        },
        xml: [{
          name: 'LoadFIBODev.rdf',
          product: 'ontology',
        }],
        ttl: [{
          name: 'LoadFIBODev.ttl',
          product: 'ontology',
        }],
        json: [{
          name: 'LoadFIBODev.jsonld',
          product: 'ontology',
        }],
        nq: [
        ],
      },
      {
        name: 'FIBO (Production) (Quickstart)',
        ttl: [{
          name: 'prod.fibo-quickstart.ttl',
          PRODUCT: 'ontology',
        }],
        nq: [
          {
            name: 'prod.fibo-quickstart.nt',
            PRODUCT: 'ontology',
          },
          {
            name: 'prod.fibo-quickstart.nt.zip',
            PRODUCT: 'ontology',
          },
        ],
      },
      {
        name: 'FIBO (Development) (Quickstart)',
        ttl: [{
          name: 'dev.fibo-quickstart.ttl',
          product: 'ontology',
        }],
        nq: [
          {
            name: 'dev.fibo-quickstart.nt',
            product: 'ontology',
          },
          {
            name: 'dev.fibo-quickstart.nt.zip',
            product: 'ontology',
          },
        ],
      },
    ],
  },
  mutations: {

  },
  actions: {

  },
  namespaced: true,
};
