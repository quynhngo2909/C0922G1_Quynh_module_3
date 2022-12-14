//1.	Tên khách hàng không được chứa số. Và các kí tự đầu tiên của mỗi từ phải viết hoa.
function checkName(name) {
    let regex = /^([A-Z][a-z]*\s)+[A-Z][a-z]*$/;
    let checkReg = regex.test(name);
    if (!checkReg) {
        document.getElementById("checkName").hidden = true;
        document.getElementById("errorName").innerHTML = "Invalid name.Name must be started with capital letter and not allowed to include number.";
        document.getElementById("saveButton").disabled = true;
    } else {
        document.getElementById("checkName").hidden = false;
        document.getElementById("errorName").innerHTML ="";
        document.getElementById("saveButton").disabled = false;
    }
}
//2.	Tên dịch vụ được phép chứa số. Và các kí tự đầu tiên của mỗi từ phải viết hoa
function checkServiceName(name) {
    let regex = /^([A-Z]([a-z]|[0-9])*\s)+[A-Z]([a-z]|[0-9])*$/;
    let checkReg = regex.test(name);
    if (!checkReg) {
        document.getElementById("checkName").hidden = true;
        document.getElementById("errorName").innerHTML = "Invalid name.Name must be started with capital letter and not allowed to include number.";
        document.getElementById("saveButton").disabled = true;
    } else {
        document.getElementById("checkName").hidden = false;
        document.getElementById("errorName").innerHTML ="";
        document.getElementById("saveButton").disabled = false;
    }
}

// 3.	Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx.
function checkPhoneNumber(phoneNumber) {
    let regex= /^(090([0-9]{7})|091([0-9]{7}))$/;
    let checkReg = regex.test(phoneNumber);
    if(!checkReg){
        document.getElementById("checkPhoneNumber").hidden = true;
        document.getElementById("errorPhoneNumber").innerHTML = "Invalid phone number. Phone number must in format: " +
            "090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx.";
    } else {
        document.getElementById("checkPhoneNumber").hidden = false;
        document.getElementById("errorPhoneNumber").innerHTML = "";
        document.getElementById("saveButton").disabled = false;

    }

}