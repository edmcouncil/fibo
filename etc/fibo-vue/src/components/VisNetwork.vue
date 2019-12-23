<template>
  <div>
    <b class="mr-1 ml-4">Connections:</b>
    <br />
    <div class="ml-4">
      <div class="form-check form-check-inline">
        <input
          class="form-check-input"
          type="checkbox"
          name="edgesFilter"
          id="internal"
          value="internal"
          checked="true"
        />
        <label class="form-check-label" for="internal">class specific</label>
      </div>
      <div class="form-check form-check-inline">
        <input
          class="form-check-input"
          type="checkbox"
          name="edgesFilter"
          id="external"
          value="external"
          checked="true"
        />
        <label class="form-check-label" for="external">inherited</label>
      </div>
      <div class="form-check form-check-inline">
        <input
          class="form-check-input"
          type="checkbox"
          name="edgesFilter"
          id="optional"
          value="optional"
          checked="true"
        />
        <label class="form-check-label" for="optional">optional</label>
      </div>
      <div class="form-check form-check-inline">
        <input
          class="form-check-input"
          type="checkbox"
          name="edgesFilter"
          id="non_optional"
          value="non_optional"
          checked="true"
        />
        <label class="form-check-label" for="non_optional">required</label>
      </div>
    </div>

    <div id="ontograph"></div>
  </div>
</template>
<script>
import vis from 'vis-network';

export default {
  name: 'vis-network',
  props: ['data'],
  mounted() {
    if (this.data) {
      const nodes = new vis.DataSet(JSON.parse(this.data.nodes));
      const edges = new vis.DataSet(JSON.parse(this.data.edges));

      const container = document.getElementById('ontograph');
      const edgeFilters = document.getElementsByName('edgesFilter');

      const edgesFilterValues = {
        optional: true,
        non_optional: true,
        internal: true,
        external: true,
      };
      const edgesFilter = edge => edgesFilterValues[edge.optional] && edgesFilterValues[edge.type];
      edgeFilters.forEach(
        filter => function (e) {
          filter.checked = 'checked';
        },
      );

      edgeFilters.forEach(filter => filter.addEventListener('change', (e) => {
        const { value, checked } = e.target;
        edgesFilterValues[value] = checked;
        edgesView.refresh();
      }));
      const edgesView = new vis.DataView(edges, { filter: edgesFilter });
      const data = {
        nodes,
        edges: edgesView,
      };
      const options = {
        edges: {
          smooth: {
            type: 'cubicBezier',
            forceDirection: 'none',
            roundness: 0.15,
          },
        },
        physics: {
          forceAtlas2Based: {
            gravitationalConstant: -95,
            centralGravity: 0.005,
            springLength: 200,
            springConstant: 0.415,
          },
          minVelocity: 0.75,
          solver: 'forceAtlas2Based',
        },
      };
      const network = new vis.Network(container, data, options);

      network.redraw();

      network.on('doubleClick', (params) => {
        params.event = '[original event]';
        const selectedNodes = params.nodes;
        const selectedEdges = params.edges;

        if (selectedNodes[0] !== undefined) {
          const sNode = selectedNodes[0];
          nodes.forEach((entry) => {
            if (entry.id === sNode) {
              if(entry.iri.match(/^https:\/\/spec\.edmcouncil\.org\/fibo/)){
                window.location.href = `/fibo${entry.iri.replace('https://spec.edmcouncil.org/fibo', '')}`; //&scrollToTop=true
              }else{
                window.location.href = `/fibo/ontology?query=${entry.iri}`; //&scrollToTop=true
              }
            }
          });
        } else if (selectedEdges[0] !== undefined) {
          const sEgde = selectedEdges[0];
          edgesView.forEach((entry) => {
            if (entry.id === sEgde) {
              if(entry.iri.match(/^https:\/\/spec\.edmcouncil\.org\/fibo/)){
                window.location.href = `/fibo${entry.iri.replace('https://spec.edmcouncil.org/fibo', '')}`; //&scrollToTop=true
              }else{
                window.location.href = `/fibo/ontology?query=${entry.iri}`; //&scrollToTop=true
              }
            }
          });
        }
      });
    }
  },
};
</script>
