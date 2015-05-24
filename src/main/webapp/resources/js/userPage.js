$(document).ready(function() {
    $('.nav-tabs > li:nth-child(2) > a').click();
    $('.edit-button').click( function(){
        $('#unStatus').remove();
        var options="";
        for (var i=0; i<noteStates.length; i++){
            options += "<option value='" + (i+1) + "'>"
                + noteStates[i] + "</option>";
        }
        $(this).parent()
            .append("<select class='form-control' id='unStatus'>"
            + options
            + "</select>");
        $('#unStatus').change(function(){
            $.ajax({
                url: '/note/edit/' + noteId + "/" + username + "/status?status=" + $('#unStatus').val(),
                success: function(result){
                    location.reload();
                },
                error: function(){
                }
            });
            this.remove();
        })
    });
});


