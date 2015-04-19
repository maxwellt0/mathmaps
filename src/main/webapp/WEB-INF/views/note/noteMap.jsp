<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
  <tiles:putAttribute name="body">
    <div class="body">
      <script src='<c:url value="/resources/js/go-debug.js"/>'></script>
      <div id="myDiagramDiv"
           style="width:1200px; height:1000px; background-color: #DAE4E4;"></div>
      <script>
        var noteName = '${noteName}';
//        alert(noteName);
        var higherNamesStr = '${higherNames}';
        var higherNames = higherNamesStr.split("~");
        var mapData = [];
        var linkData = [];
        for (var i=0; i<higherNames.length; i++){
//          alert(higherNames[i]);
          mapData[i] = { key: higherNames[i] };
          linkData[i] = { from: higherNames[i] , to: noteName};
        }
        mapData[higherNames.length] = { key: noteName };

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