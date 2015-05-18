var myDiagramDiv = "myDiagramDiv";

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
    $(go.Diagram, myDiagramDiv,
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
                window.location.href = "/note/page/" + obj.part.data.key;
            }
        }
    );

myDiagram.layout = $(go.LayeredDigraphLayout, {direction: 90, columnSpacing: 30, layerSpacing: 50});
var model = $(go.GraphLinksModel);
model.nodeDataArray = mapData;
model.linkDataArray = linkData;
myDiagram.model = model;
