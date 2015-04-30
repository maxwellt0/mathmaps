<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
  <tiles:putAttribute name="body">
    <div class="body">
      <script src='<c:url value="/resources/js/go-debug.js"/>'></script>
          <div id="myDiagramDiv"
               style="width:1200px; height:1000px; background-color: #e0e0e0;"></div>
          <script>
          function fillMapData(data, names){
              for (var i=0; i<names.length; i++){
                  data[data.length] = { key: names[i] };
              }
              return data;
          }
          // direction: 0 = from names to note, 1 = from note to names
          function fillLinkData(data, names, note, direction){
              for (var i=0; i<names.length; i++){
                  if (direction == 0) {
                      data[data.length] = { from: names[i] , to: note};
                  } else {
                      data[data.length] = { from: note , to: names[i]};
                  }
              }
              return data;
          }
          var noteName = '${noteName}';
          var hNames = JSON.parse('${hNames}');
          var lNames = JSON.parse('${lNames}');

          var mapData = [];
          mapData = fillMapData(mapData, hNames);
          mapData = fillMapData(mapData, lNames);
          mapData[mapData.length] = { key: noteName };

          var linkData = [];
          linkData = fillLinkData(linkData, hNames, noteName, 0);
          linkData = fillLinkData(linkData, lNames, noteName, 1);

            var $ = go.GraphObject.make;
            var myDiagram =
                    $(go.Diagram, "myDiagramDiv",
                            {
                              initialContentAlignment: go.Spot.Center, // Center Diagram contents
                              "undoManager.isEnabled": true // enable Ctrl-Z to undo and Ctrl-Y to redo
                            });

            // the template we defined earlier
            myDiagram.nodeTemplate =
                    $(go.Node, "Horizontal",
                            { background: "#44CCFF" },
                            $(go.TextBlock, "Default Text",
                                    { margin: 12, stroke: "white", font: "bold 16px sans-serif" },
                                    new go.Binding("text", "key"))
                    );
            //    myDiagram.linkTemplate =
            //            $(go.Link,
            //                    { routing: go.Link.Orthogonal, corner: 3 },
            //                    $(go.Shape),
            //                    $(go.Shape, { toArrow: "Standard" })
            //            );

            myDiagram.layout = $(go.LayeredDigraphLayout, { columnSpacing: 30, layerSpacing: 50 });

            var model = $(go.GraphLinksModel);
            model.nodeDataArray = mapData;
            model.linkDataArray = linkData;
            myDiagram.model = model;
      </script>
    </div>
  </tiles:putAttribute>
</tiles:insertDefinition>