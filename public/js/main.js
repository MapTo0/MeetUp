$(document).ready(function() {
    var $LoginButton = $("#login-button"),
        $RegisterButton = $("#register-button");
    $LoginButton.on("click", function() {
        callForLogin();
    });

    $RegisterButton.click(function(event) {
        event.preventDefault();
        var oRegisterData = {
                email: $("#register-email").val(),
                firstName: $("#register-firstName").val(),
                lastName: $("#register-lastName").val(),
                password: $("#register-password").val()
        };

        $.ajax({
            url: '/register',
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(oRegisterData),
            statusCode: {
                401: function() {
                    console.log('Already a user');
                },
                200: function() {
                    console.log('Welcome');
                }
            }
        });
    });

    function callForLogin() {

        var oUserData = {
            email: $("#login-email").val(),
            password: $("#login-password").val()
        };

        $.ajax({
            url: '/login',
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(oUserData),
            statusCode: {
                403: function() {
                    console.log("bad login");
                },
                200: function() {
                    console.log('nice');
                }
            }
        });
    }

    function DO_NOT_EVER_WRITE_SUCH_CODE(string, position) {
        return string.responseText.split(',')[position].split(':')[1].slice(1, (string.responseText.split(',')[position].split(':')[1].length));
    }

    function validate() {
        var $FirstName = $('#register-firstName'),
            $LastName = $('#register-lastName'),
            $Email = $('#register-email'),
            $Password = $('#register-password');

        function validateEmail(email) {
            var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            return re.test(email);
        }

        if (($FirstName.val().length === 0) || ($FirstName.val().length > 20) || ($LastName.val().length === 0) || ($LastName.val().length > 20) || (!validateEmail($Email.val())) || $Password.val().length < 8) {
            alert('Моля проверете отново данните, които сте въвели!');
            return false;
        }
        return true;
    }
});
