<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body">
            <div class="modal-div">

            </div>
            <script src='<c:url value="/resources/js/go-debug.js"/>'></script>
            <div id="myDiagramDiv" style="width:100%; height:88vh; background-color: #ffffff;"></div>
            <script>
                var showNoteMiniPage = function (noteId){
                    jQuery(function($){
                        $.ajax({
                            url: '/note/' + noteId,
                            success: function (result) {
                                $('.modal-div').empty();
                                $('.modal-div').append(result);
                                $('#noteModal').modal('show');
                                MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
                            }
                        });
                    });

                };
                var mapData = JSON.parse('${names}');
                var linkData = JSON.parse('${links}');

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
                                        {strokeWidth: 1, stroke: null, name: "SHAPE"},
                                        new go.Binding("fill", "color")
                                ),
                                $(go.TextBlock,
                                        {margin: 10, font: "bold 16px Verdana", name: "TEXT"},
                                        new go.Binding("text", "name")
                                ),
                                {
                                    click: function (e, obj) {
                                        showNoteMiniPage(obj.part.data.key);
//                                        window.location.href = "/note/page/" + obj.part.data.key;
                                    }
                                }
                        );
//                myDiagram.linkTemplate =
//                        $(go.Link,
//                                {routing: go.Link.Orthogonal, corner: 3},
//                                $(go.Shape),
//                                $(go.Shape, {toArrow: "Standard"})
//                        );

                myDiagram.layout = $(go.LayeredDigraphLayout, {direction: 90, columnSpacing: 30, layerSpacing: 50});
//                myDiagram.layout.packOption = 10;

                var model = $(go.GraphLinksModel);
                model.nodeDataArray = mapData;
                model.linkDataArray = linkData;
                myDiagram.model = model;
            </script>
        </div>
        <script type="text/x-mathjax-config">
    MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
</script>
        <script type="text/javascript"
                src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>