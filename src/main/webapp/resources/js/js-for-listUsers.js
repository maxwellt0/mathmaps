/**
 * Created by Maxwellt on 11.04.2015.
 */
function addUser() {
    $('#userDialog').dialog("option", "title", 'Add User');
    $('#userDialog').dialog('open');
}

function editUser(userId) {

    $.get("get/" +userId, function(result) {

        $("#userDialog").html(result);
        $('#userDialog').dialog("option", "title", 'Edit User');
        $("#userDialog").dialog('open');

        initializeDatePicker();
    });
}

function initializeDatePicker() {
    $(".datepicker").datepicker({
        dateFormat : "yy-mm-dd",
        changeMonth : true,
        changeYear : true,
        showButtonPanel : true
    });
}

function resetDialog(form) {

    form.find("input").val("");
}

$(document).ready(function() {

    $('#userDialog').dialog({
        autoOpen : false,
        position : 'center',
        modal : true,
        resizable : false,
        width : 440,
        buttons : {
            "Save" : function() {
                $('#userForm').submit();
            },
            "Cancel" : function() {
                $(this).dialog('close');
            }
        },
        close : function() {

            resetDialog($('#userForm'));
            $(this).dialog('close');
        }
    });

    initializeDatePicker();
});

