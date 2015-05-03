$(document).ready(function () {
    $("#assocNotes > option").each(function () {
        for (var i = 0; i < lowerIds.length; i++) {
            if (this.value == lowerIds[i]) {
                $("#assocNotes > option[value="+lowerIds[i]+"]").attr('selected', 'selected');
                $("#lower").append(this);
            }
        }
        for ( i = 0; i < higherIds.length; i++){
            if (this.value == higherIds[i]){
                $("#assocNotes > option[value="+higherIds[i]+"]").attr('selected', 'selected');
                $("#higher").append(this);
            }
        }
    });
    $("#status").val("" + status + "");
    $("#type").val("" + typeId + "");
});
