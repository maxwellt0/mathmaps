$(document).ready(function() {
    $('.paginated').dataTable({
        "dom": '<<t>p>',
        //"lengthMenu":[ [10, 25, 50, -1], [10, 25, 50, "Всі"]],
        "lengthMenu":[ [25, -1], [25, "Всі"]],
        "info":     false,
        "columns": [
            null,
            null,
            null,
            { "orderable": false }
        ],
        "order": [ 0, 'asc' ],
        "language": {
            "sProcessing":   "Зачекайте...",
            "sLengthMenu":   "Показати _MENU_ записів",
            "sZeroRecords":  "Записи відсутні.",
            "sInfo":         "Записи з _START_ по _END_ із _TOTAL_ записів",
            "sInfoEmpty":    "Записи з 0 по 0 із 0 записів",
            "sInfoFiltered": "(відфільтровано з _MAX_ записів)",
            "sInfoPostFix":  "",
            "sSearch":       "Пошук:",
            "sUrl":          "",
            "oPaginate": {
                "sFirst": "Перша",
                "sPrevious": "Попередня",
                "sNext": "Наступна",
                "sLast": "Остання"
            },
            "oAria": {
                "sSortAscending":  ": активувати для сортування стовпців за зростанням",
                "sSortDescending": ": активувати для сортування стовпців за спаданням"
            }
        }
    });
});
