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
            { "orderable": false },
            { "orderable": false }
        ],
        "order": [ 0, 'asc' ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/f2c75b7247b/i18n/Ukranian.json"
        }
    });
});
