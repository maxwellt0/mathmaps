$(document).ready(function() {
    var myValidator = $('#registrationForm').validate({
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

    jQuery.validator.addMethod("unique", function(value, element){
            return false;
        }, "Такий логін вже існує");

    // Username check
    $('#username').change(function() {
        delay(
            function() {
                if ($('#username').val().length >= 3) {
                    $.ajax({
                        url: 'check/' + $('#username').val(),
                        success: function (result) {
                            if (result == 1) {
                                myValidator.showErrors({ username : "Такий логін вже існує"});
                                $("#submit").attr('disabled', 'disabled');
                            } else {
                                $("#submit").removeAttr('disabled');
                            }
                        }
                    });
                }
            },
            500
        );
    });

});