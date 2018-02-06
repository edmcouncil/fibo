# Hosting https://spec.edmcouncil.org

The primary HTTP server running on `https://spec.edmcouncil.org` receives all the traffic, all the HTTP requests to any
of the artifacts but does not necessarily process the full request itself. In other words, the content can come from
other servers, where the main HTTP server is merely passing requests through.
This primary server is an NGINX server (the [open source version](https://nginx.org/en/)).

## Links

- [Publishing Process](README.md)
- [artifacts](artifacts.md)
- [IRI Scheme](iri-scheme.md)
- [hosting](hosting.md)
