const getOntology = function (query, domain) {
    
    return fetch(domain, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: query, mode: 'no-cors', });
}

export { getOntology };
