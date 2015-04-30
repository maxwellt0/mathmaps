//function addNote() {
//    $('#noteDialog').dialog("option", "title", 'Add Note');
//    $('#noteDialog').dialog('open');
//}
//
//function editNote(noteId) {
//
//    $.get("get/" +noteId, function(result) {
//
//        $("#noteDialog").html(result);
//        $('#noteDialog').dialog("option", "title", 'Edit Note');
//        $("#noteDialog").dialog('open');
//
//        initializeDatePicker();
//    });
//}

//function initializeDatePicker() {
//    $(".datepicker").datepicker({
//        dateFormat : "yy-mm-dd",
//        changeMonth : true,
//        changeYear : true,
//        showButtonPanel : true
//    });
//}

//function resetDialog(form) {
//
//    form.find("input").val("");
//}

$(document).ready(function() {

    $('.nav-tabs > li:nth-child(2) > a').click();

    $('#form-submit').click(function(){
        $('#noteForm').submit();
    });

    //$('#noteDialog').dialog({
    //
    //    autoOpen : false,
    //    position : 'center',
    //    modal : true,
    //    resizable : false,
    //    width : 700,
    //    buttons : {
    //        "Save" : function() {
    //            $('#noteForm').submit();
    //        },
    //        "Cancel" : function() {
    //            $(this).dialog('close');
    //        }
    //    },
    //    close : function() {
    //
    //        resetDialog($('#noteForm'));
    //        $(this).dialog('close');
    //    }
    //});

    //initializeDatePicker();
});

