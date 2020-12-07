let d = document;

window.onload = ()=>{//когда документ загрузится сработает функция(лямбда-выраЖение)
    //проверка правильности введенных данных
    function validateForm() {
        let isYCorrect = true;
        let elemY = $("#inputY");//достаем эл-т с id = inputY
        if( elemY.val()===''/*если строчка пустая*/ || +elemY.val()<=-5 || +elemY.val()>=5  || !isNumber(elemY.val())) {
            isYCorrect = false; 
        }
        elemY.toggleClass("error",!isYCorrect);//добавляет или удаляет класс
        
        let isRCorrect = true;
        let elemR = $("#inputR");
        if( elemR.val()==='' || +elemR.val()<=1 || +elemR.val()>=4 || !isNumber(elemR.val()) ) {
            isRCorrect = false;
        }
        elemR.toggleClass("error",!isRCorrect);
        return isYCorrect && isRCorrect;
    }

    //Добавление строчки в таблицу
    function add_row(x, y, r, dt, time, result){//respond - объект с результатами
        // Находим нужную таблицу
        let tbody = d.getElementById('result-table').getElementsByTagName('TBODY')[0];
        // Создаем строку таблицы и добавляем ее
        let row = d.createElement("TR");
        tbody.appendChild(row);


        // Создаем ячейки в вышесозданной строке
        // и добавляем тх
        let td1 = d.createElement("TH");
        let td2 = d.createElement("TH");
        let td3 = d.createElement("TH");
        let td4 = d.createElement("TH");
        let td5 = d.createElement("TH");
        let td6 = d.createElement("TH");

        row.appendChild(td1);
        row.appendChild(td2);
        row.appendChild(td3);
        row.appendChild(td4);
        row.appendChild(td5);
        row.appendChild(td6);

        // Наполняем ячейки
        td1.innerHTML = x;
        td2.innerHTML = y;
        td3.innerHTML = r;
        td4.innerHTML = dt;
        td5.innerHTML = time;
        td6.innerHTML = result;
    }


    //ajax запрос - ответ
    function ajaxQuery() {
        let data = {};
        //заполняем объект data
        data['y'] =  $("#inputY").val();
        data['r'] =  $("#inputR").val()
        data['x'] =  $(".insideForm input:checked").val()
        // AJAX запрос
        $.ajax({
            url         : 'submit.php',
            type        : 'GET',
            data        : data,
            cache       : false,
            dataType    : 'text',
            // функция успешного ответа сервера
            success     : function( respond, status, jqXHR ){
                var array = respond.split("$#$");
                if(array[5]==="Введены неправильные значения"){
                    alert("Введены неправильные значения")
                }
                else {
                    add_row(array[0], array[1], array[2], array[3], array[4], array[5]);
                }
            },
            // функция ошибки ответа сервера
            error       : function( jqXHR, status, errorThrown ){
                console.log( 'ОШИБКА AJAX запроса: ' + status, jqXHR );
            }
        });
    }

    $('#myForm').on('submit', function(event) {//событи отправки на сервер
        event.preventDefault(); // отменяем событие по умолчанию
        if ( !validateForm() ) { // если есть ошибки возвращает true
          return false; // прерываем выполнение скрипта
        }
        ajaxQuery()
      });
}
function isNumber(value) {
    return !(value.replace(/\s/g, '').length === 0 || isNaN(value));
}

var printButton = document.search.print;
printButton.addEventListener("click", printForm);