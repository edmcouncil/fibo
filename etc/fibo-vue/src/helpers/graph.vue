<template>
  <div>
    <b class="mr-1 ml-4">Connections:</b>
    <br />
    <div class="ml-4">
      <label>
        <input type="checkbox" name="edgesFilter" value="internal" checked="true" />
        class specyfic
      </label>
      <label>
        <input type="checkbox" name="edgesFilter" value="external" checked="true" />
        inherited
      </label>
    </div>
    <div class="ml-4">
      <label>
        <input type="checkbox" name="edgesFilter" value="optional" checked="true" />
        optional
      </label>
      <label>
        <input type="checkbox" name="edgesFilter" value="non_optional" checked="true" />
        required
      </label>
    </div>

    <div id="ontograph"></div>
  </div>
</template>
<script>
import vis from "vis-network";

export default {
  name: "graph",
  props: ["data"],
  mounted: function() {
    if (this.data) {
      let nodes = new vis.DataSet(JSON.parse(this.data.nodes));
      let edges = new vis.DataSet(JSON.parse(this.data.edges));

      var container = document.getElementById("ontograph");
      const edgeFilters = document.getElementsByName("edgesFilter");

      const edgesFilterValues = {
        optional: true,
        non_optional: true,
        internal: true,
        external: true
      };
      const edgesFilter = edge => {
        return edgesFilterValues[edge.optional] && edgesFilterValues[edge.type];
      };
      edgeFilters.forEach(
        filter =>
          function(e) {
            filter.checked = "checked";
          }
      );

      edgeFilters.forEach(filter =>
        filter.addEventListener("change", e => {
          const { value, checked } = e.target;
          edgesFilterValues[value] = checked;
          edgesView.refresh();
        })
      );
      const edgesView = new vis.DataView(edges, { filter: edgesFilter });
      var data = {
        nodes: nodes,
        edges: edgesView
      };
      var options = {
        edges: {
          smooth: {
            type: "cubicBezier",
            forceDirection: "none",
            roundness: 0.15
          }
        },
        physics: {
          forceAtlas2Based: {
            gravitationalConstant: -95,
            centralGravity: 0.005,
            springLength: 200,
            springConstant: 0.415
          },
          minVelocity: 0.75,
          solver: "forceAtlas2Based"
        }
      };
      var network = new vis.Network(container, data, options);

      var height = 500;
      container.style.height = height + "px";
      network.redraw();

      network.on("doubleClick", function(params) {
        params.event = "[original event]";
        var selectedNodes = params.nodes;
        var selectedEdges = params.edges;

        if (selectedNodes[0] !== undefined) {
          var sNode = selectedNodes[0];
          nodes.forEach(function(entry) {
            if (entry.id === sNode) {
              window.location.href = "/fibo/ontology?query=" + entry.iri;
            }
          });
        } else if (selectedEdges[0] !== undefined) {
          var sEgde = selectedEdges[0];
          edgesView.forEach(function(entry) {
            if (entry.id === sEgde) {
              window.location.href = "/fibo/ontology?query=" + entry.iri;
            }
          });
        }
      });
    }
  }
};
</script>
