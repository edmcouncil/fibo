const getOntology = function (query) {
    var Url = new URL('/fibo/ontology', window.location.href);
    return fetch(Url.href, {method: 'POST', headers: {'Content-Type': 'application/json'}, body: query});
}

export { getOntology }
