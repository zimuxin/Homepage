function $() {
    return document.getElementById(arguments[0]);
}

function ajaxFunction(name, password) {
    var xmlhttp;
    xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {
            var responseText = xmlhttp.responseText;

            if (responseText.trim() == "successfully!") {
                window.location.href = "index.jsp";
                return;
            }
            $("ajax-msg").innerHTML = responseText;
        }
    }
    xmlhttp.open("post", "welcome.jsp?loginName=" + name + "&loginPwd=" + password, true);
    xmlhttp.send(null);
}