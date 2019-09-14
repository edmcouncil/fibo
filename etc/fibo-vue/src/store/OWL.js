export default {
  state: {
    serializations: [
      {
        name: 'FIBO (Production) (zip)',
        xml: [{
          name: 'prod.rdf.zip',
          url: '/fibo/ontology/master/${timestamp}/prod.rdf.zip',
        }],
        ttl: [{
          name: 'prod.ttl.zip',
          url: '/fibo/ontology/master/${timestamp}/prod.ttl.zip',
        }],
        json: [{
          name: 'prod.jsonld.zip',
          url: '/fibo/ontology/master/${timestamp}/prod.jsonld.zip',
        }],
        nq: [
          {
            name: 'prod.fibo.nq',
            url: '/fibo/ontology/master/${timestamp}/prod.fibo.nq',
          },
          {
            name: 'prod.fibo.nq.zip',
            url: '/fibo/ontology/master/${timestamp}/prod.fibo.nq.zip',
          },
        ],
      },
      {
        name: 'FIBO (Development) (zip)',
        xml: [{
          name: 'dev.rdf.zip',
          url: '/fibo/ontology/master/latest/dev.rdf.zip',
        }],
        ttl: [{
          name: 'dev.ttl.zip',
          url: '/fibo/ontology/master/latest/dev.ttl.zip',
        }],
        json: [{
          name: 'dev.jsonld.zip',
          url: '/fibo/ontology/master/latest/dev.jsonld.zip',
        }],
        nq: [
          {
            name: 'dev.fibo.nq',
            url: '/fibo/ontology/master/latest/dev.fibo.nq',
          },
          {
            name: 'dev.fibo.nq.zip',
            url: '/fibo/ontology/master/latest/dev.fibo.nq.zip',
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
          name: 'AboutFIBOProd.rdf',
          url: '/fibo/ontology/master/${timestamp}/AboutFIBOProd.rdf',
        }],
        ttl: [{
          name: 'AboutFIBOProd.ttl',
          url: '/fibo/ontology/master/${timestamp}/AboutFIBOProd.ttl',
        }],
        json: [{
          name: 'AboutFIBOProd.jsonld',
          url: '/fibo/ontology/master/${timestamp}/AboutFIBOProd.jsonld',
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
          name: 'AboutFIBODev.rdf',
          url: '/fibo/ontology/master/latest/AboutFIBODev.rdf',
        }],
        ttl: [{
          name: 'AboutFIBODev.ttl',
          url: '/fibo/ontology/master/latest/AboutFIBODev.ttl',
        }],
        json: [{
          name: 'AboutFIBODev.jsonld',
          url: '/fibo/ontology/master/latest/AboutFIBODev.jsonld',
        }],
        nq: [
        ],
      },
      {
        name: 'FIBO (Production) (Quickstart)',
        ttl: [{
          name: 'prod.fibo-quickstart.ttl',
          url: '/fibo/ontology/master/${timestamp}/prod.fibo-quickstart.ttl',
        }],
        nq: [
          {
            name: 'prod.fibo-quickstart.nt',
            url: '/fibo/ontology/master/${timestamp}/prod.fibo-quickstart.nt',
          },
          {
            name: 'prod.fibo-quickstart.nt.zip',
            url: '/fibo/ontology/master/${timestamp}/prod.fibo-quickstart.nt.zip',
          },
        ],
      },
      {
        name: 'FIBO (Development) (Quickstart)',
        ttl: [{
          name: 'dev.fibo-quickstart.ttl',
          url: '/fibo/ontology/master/latest/dev.fibo-quickstart.ttl',
        }],
        nq: [
          {
            name: 'dev.fibo-quickstart.n',
            url: '/fibo/ontology/master/latest/dev.fibo-quickstart.n',
          },
          {
            name: 'dev.fibo-quickstart.nt.zip',
            url: '/fibo/ontology/master/latest/dev.fibo-quickstart.nt.zip',
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
