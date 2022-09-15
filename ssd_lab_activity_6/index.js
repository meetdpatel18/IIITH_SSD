function validatePassword() {
    str1 = document.getElementById("server-password").value;
    str2 = document.getElementById("confirm-password").value;

    if (str1 != str2) {
        document.getElementById("password-err").innerHTML = "Password and Confirm Password do not Match";
    }
    else {
        document.getElementById("password-err").innerHTML = "";
    }
}

function checkUserName() {
    str = document.getElementById("server-username").value;
    upper = /[A-Z]/.test(str);
    digit = /[0-9]/.test(str);

    if (!upper || !digit) {
        document.getElementById("username-err").innerHTML = "Invalid Username Must Contain atleast one Uppercase and one Digit";
    }
    else {
        document.getElementById("username-err").innerHTML = "";
    }
}

function dragstartHandler(evt) {
    evt.dataTransfer.setData("MyDraggedElementId", evt.target.id);
}

function dragoverHandler(evt) {
    evt.preventDefault();
}

function dropHandler(evt) {
    evt.preventDefault();
    var elementId = evt.dataTransfer.getData("MyDraggedElementId");
    evt.target.appendChild(document.getElementById(elementId));
}

function getDetails() {
    str1 = document.getElementById("manager-name").value;
    str2 = document.getElementById("email").value;
    str3 = document.getElementById("server-username").value;
    str4 = document.getElementById("team-lead").value;
    str5 = document.getElementById("dragtarget-div1").value;
    // str5 = document.getElementById("droptarget-div").value;

    alert('Name: ' + str1 + '\n' + 'Email: ' + str2 + '\n' + 'Username: ' + str3 + '\n' + 'Team Lead: ' + str4 + '\n');
}