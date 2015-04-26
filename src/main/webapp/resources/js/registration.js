$(document).ready(function() {
    $('#registrationForm').validate({
        rules: {
            "username": {
                required : true,
                rangelength :[3, 16]
            },
            "email":{
                required : true,
                email : true
            },
            "password": {
                required : true,
                rangelength : [6, 16]
            },
            "confirmPassword":{
                required : true,
                rangelength : [6, 16],
                equalTo : "#password"
            }
        },
        messages: {
            "username": {
                required : "Це поле обов\'язкове",
                rangelength : "Від 3 до 16 символів"
            },
            "email":{
                required : "Це поле обов\'язкове",
                email : "Невірний формат email"
            },
            "password": {
                required : "Це поле обов\'язкове",
                rangelength : "Від 6 до 16 символів"
            },
            "confirmPassword":{
                required : "Це поле обов\'язкове",
                rangelength : "Від 6 до 16 символів",
                equalTo : "Паролі не збігаються"
            }
        }
    });

    var delay = (function(){
        var timer = 0;
        return function(callback, ms){
            clearTimeout (timer);
            timer = setTimeout(callback, ms);
        };
    })();

        // Username check
        $('#username').keyup(function() {
            delay(
                function() {
                    if ($('#username').val().length >= 3) {
                        $.ajax({
                            url: 'check/' + $('#username').val(),
                            success: function (result) {
                                if (result == 1) {
                                    $('#login-errors').html(
                                        'Такий логін вже існує'
                                    );
                                    $("#submit").attr('disabled', 'disabled');
                                } else {
                                    $('#login-errors').html("");
                                    $("#submit").removeAttr('disabled');
                                }
                            }
                        });
                    }
                }, 
                500
            );
            if ($('#login').val().length < 3) {
                $('#login-errors').html("");
            }
        });
    });