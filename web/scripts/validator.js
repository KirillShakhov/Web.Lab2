"use strict";

let x, y, r;

//Обновляет значение x в соответсвии с нажатой кнопкой, добавляет ей эффекты (подсветка и увеличение), убирая их для остальных кнопок группы.
document.addEventListener("DOMContentLoaded", () => {
    let Y_buttons = document.querySelectorAll("input[name=Y-button]");
    Y_buttons.forEach(click);
    function click(element) {
        element.onclick = function () {
            y = this.value;
            Y_buttons.forEach(function (element) {
                element.style.boxShadow = null;
                element.style.backgroundColor = null;
                element.style.color = null;
            });
            this.style.backgroundColor = "#f41c52";
            this.style.color = "white";
        }
    }
});

//Обновляет значение x в соответсвии с нажатой кнопкой, добавляет ей эффекты (подсветка и увеличение), убирая их для остальных кнопок группы.
document.addEventListener("DOMContentLoaded", () => {
    let R_buttons = document.querySelectorAll("input[name=R-button]");
    R_buttons.forEach(click);
    function click(element) {
        element.onclick = function () {
            r = this.value;
            R_buttons.forEach(function (element) {
                element.style.boxShadow = null;
                element.style.backgroundColor = null;
                element.style.color = null;
            });
            this.style.backgroundColor = "#f41c52";
            this.style.color = "white";
        }
    }
});

document.getElementById("checkButton").onclick = function () {
    if (validateX() && validateY() && validateR()) sendRequest("button");
};

//Параметр key установливает, тип запроса обработки точки на сервере: "button" - для клика по кнопке, "svg" - для клика по канвасу.
function sendRequest(key) {
    const keys = ["button", "svg"];
    if (keys.includes(key)) {
        let request = "x=" + encodeURIComponent(x) + "&y=" + encodeURIComponent(y) + "&r=" + encodeURIComponent(r) +
                "&key=" + encodeURIComponent(key);
        fetch("app", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
            body: request
        }).then(response => response.text()).then(function (serverAnswer) {
            document.getElementById("outputContainer").innerHTML = serverAnswer;
        }).catch(err => createNotification(`Ошибка HTTP ${err.textContent}. Повторите попытку позже.`));
    } else throw new Error("Не указан ключ отправки");
}

function createNotification(message) {
    let outputContainer = document.getElementById("outputContainer");
    if (outputContainer.contains(document.querySelector(".notification"))) {
        let stub = document.querySelector(".notification");
        stub.textContent = message;
        stub.classList.replace("outputStub", "errorStub");
    } else {
        let notificationTableRow = document.createElement("h4");
        notificationTableRow.innerHTML = "<span class='notification errorStub'></span>";
        outputContainer.prepend(notificationTableRow);
        let span = document.querySelector(".notification");
        span.textContent = message;
    }
}

function validateX() {
    x = document.querySelector("input[name=X-input]").value.replace(",", "."); //замена разделителя дробной части числа
    if (x === undefined) {
        createNotification("x не введён");
        return false;
    } else if (!isNumeric(x)) {
        createNotification("x не число");
        return false;
    } else if (!((x > -5) && (x < 5))) {
        createNotification("y не входит в область допустимых значений");
        return false;
    } else return true;
}

function validateY() {
    if (isNumeric(y)) return true;
    else {
        createNotification("y не выбран");
        return false;
    }
}

function validateR() {
    // //r = document.querySelector("input[type=radio]:checked").value;
    // let checked = document.getElementsByClassName('rb');
    // r = 0;
    // for (let el = 0; checked[el]; el++) {
    //     if (checked[el].checked) {
    //         r += Number(checked[el].value);
    //     }
    // }
    // if(r<=0 || r > 15){
    //     createNotification("Значение R не выбрано");
    //     return false
    //
    // }
    // else{
    //     return true;
    // }
    if (isNumeric(r)) return true;
    else {
        createNotification("r не выбран");
        return false;
    }
}

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}