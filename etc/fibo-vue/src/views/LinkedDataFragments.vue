<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>FIBO Linked Data Fragments</span>
        </h1>
        <h2></h2>
        <p>
          To increase the availability of FIBO triples from our Linked Data
          Fragment server are
          available
          <a href="http://fragments.edmcouncil.org/">here</a>.
        </p>
        <p>
          A linked data fragment client can be pointed to that location.
          Linked Data Fragment client and server
          implementation are available
          <a href="http://linkeddatafragments.org/">here</a>.
        </p>
        <p>
          The purpose of this server is to make FIBO available to intelligent clients that can process triples in client-side SPARQL. A triple pattern specification is very lightweight, and still allows SPARQL
          endpoint-like access to data. One can look at this protocol method as sitting between a full RDF dump file and a SPARQL
          endpoint. We plan to offer client implementation from this server after some further testing and finding some handy queries to prepopulate. Other fragments servers in production can be found
          <a href="http://data.linkeddatafragments.org/">here</a>.
        </p>

        <h2>Release Notes</h2>
        <ul>
          <li>
            <b>2017 Q3</b>
            <ul>
              <li>Initial release</li>
            </ul>
          </li>
        </ul>
      </article>
    </main>
  </div>
</template>

<script>
export default {
  name: 'linked-data-fragments',
  components: {},
};
</script>

<style>
article {
  padding-top: 30px;
}
article h2 {
  font-size: 17px;
  color: #455560;
  line-height: 28px;
  text-transform: none;
  padding-top: 30px;
  padding-bottom: 10px;
  text-align: left;
  font-weight: 400;
  letter-spacing: 1px;
}
</style>
