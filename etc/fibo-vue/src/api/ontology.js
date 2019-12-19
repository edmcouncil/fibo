const parseServerError = function (response) {
  if (response.status >= 400 && response.status < 600) {
    throw new Error('Bad response from server');
  }
  return response;
};

const getOntology = function (query, domain) {
  return fetch(domain, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: query,
    mode: 'no-cors',
  }).then(parseServerError);
};
const getModules = function (domain) {
  return fetch(domain, {
    method: 'GET',
    mode: 'no-cors',
  }).then(parseServerError);
};

const getHint = function (query, domain) {
  return fetch(domain + '/', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: query,
    mode: 'no-cors',
  }).then(parseServerError);
};


export { getOntology, getModules, getHint };
