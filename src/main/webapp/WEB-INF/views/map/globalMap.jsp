<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body">
            <script src='<c:url value="/resources/js/go-debug.js"/>'></script>
            <div id="myDiagramDiv"
                 style="width:1200px; height:1000px; background-color: #ffffff;"></div>
            <script>
                function fillMapData(data, names) {
                    for (var i = 0; i < names.length; i++) {
                        data[data.length] = {key: names[i], color: "#abcdff"};
                    }
                    return data;
                }

                var names = JSON.parse('${names}');


                var mapData = [];
                mapData = fillMapData(mapData, names);

                var linkData = JSON.parse('${links}');
                alert(linkData);

                function mouseEnter(e, obj) {
                    var shape = obj.findObject("SHAPE");
                    shape.fill = "#6DAB80";
                    shape.stroke = "#A6E6A1";
                    var text = obj.findObject("TEXT");
                    text.stroke = "white";
                }

                function mouseLeave(e, obj) {
                    var shape = obj.findObject("SHAPE");
                    // Return the Shape's fill and stroke to the defaults
                    shape.fill = obj.data.color;
                    shape.stroke = null;
                    // Return the TextBlock's stroke to its default
                    var text = obj.findObject("TEXT");
                    text.stroke = "black";
                }

                var $ = go.GraphObject.make;
                var myDiagram =
                        $(go.Diagram, "myDiagramDiv",
                                {
                                    initialContentAlignment: go.Spot.Center, // Center Diagram contents
                                    "undoManager.isEnabled": true // enable Ctrl-Z to undo and Ctrl-Y to redo
                                });

                myDiagram.nodeTemplate =
                        $(go.Node, "Auto",
                                {
                                    mouseEnter: mouseEnter,
                                    mouseLeave: mouseLeave
                                },
                                $(go.Shape, "Rectangle",
                                        {strokeWidth: 2, stroke: null, name: "SHAPE"},
                                        new go.Binding("fill", "color")
                                ),
                                $(go.TextBlock,
                                        {margin: 10, font: "bold 18px Verdana", name: "TEXT"},
                                        new go.Binding("text", "key")
                                ),
                                {
                                    click: function (e, obj) {
                                        window.location.href = "/note/";
                                    }
                                }
                        );
                //                myDiagram.linkTemplate =
                //                        $(go.Link,
                //                                { routing: go.Link.Orthogonal, corner: 3 },
                //                                $(go.Shape),
                //                                $(go.Shape, { toArrow: "Standard" })
                //                        );

                myDiagram.layout = $(go.LayeredDigraphLayout, {columnSpacing: 30, layerSpacing: 50});

                var model = $(go.GraphLinksModel);
                model.nodeDataArray = mapData;
                model.linkDataArray = linkData;
                myDiagram.model = model;
            </script>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>