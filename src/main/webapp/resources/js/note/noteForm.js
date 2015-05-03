$("#fromLower").click(function () {
    var selectedItem = $("#lower option:selected");
    $("#assocNotes").append(selectedItem);
});

$("#toLower").click(function () {
    var selectedItem = $("#assocNotes option:selected");
    $("#lower").append(selectedItem);
});

$("#fromHigher").click(function () {
    var selectedItem = $("#higher option:selected");
    $("#assocNotes").append(selectedItem);
});

$("#toHigher").click(function () {
    var selectedItem = $("#assocNotes option:selected");
    $("#higher").append(selectedItem);
});
