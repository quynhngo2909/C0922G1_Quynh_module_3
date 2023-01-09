function checkName(name) {
    let regex = /^Quynh$/;
    let checkReg = regex.exec(name);
    if (!checkReg) {
        document.getElementById("checkName").hidden = true;
        document.getElementById("errorName").innerHTML = "Invalid name.Name must be started with capital letter.";
        document.getElementById("saveButton").disabled = true;
    } else {
        document.getElementById("checkName").hidden = false;
        document.getElementById("errorName").innerHTML ="";
        document.getElementById("saveButton").disabled = false;
    }
}