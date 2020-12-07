<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Table</title>
    <link href="stylesheets/main_page.css" rel="stylesheet">
    <link href="stylesheets/check_button.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <!-- import jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- import js -->
    <script src="functions.js"></script>
    <link rel="icon" type="image/jpg" href="images/favicon.jpg">
</head>
<body>
    <header>
        <p class="studentName">Сухняк Данила Дмитриевич</p>
        <p class="groupNumber">Группа P3232</p>
        <p class="optionNumber">Вариант 2816</p>
    </header>
    <div class="content">
        <svg xmlns="http://www.w3.org/2000/svg" width="300" height="300">
            <line x1="0" y1="150" x2="300" y2="150" stroke="#000720"></line>
            <line x1="150" y1="0" x2="150" y2="300" stroke="#000720"></line>
            <line x1="270" y1="148" x2="270" y2="152" stroke="#000720"></line>
            <text x="265" y="140">R</text>
            <line x1="210" y1="148" x2="210" y2="152" stroke="#000720"></line>
            <text x="200" y="140">R/2</text>
            <line x1="90" y1="148" x2="90" y2="152" stroke="#000720"></line>
            <text x="75" y="140">-R/2</text>
            <line x1="30" y1="148" x2="30" y2="152" stroke="#000720"></line>
            <text x="20" y="140">-R</text>
            <line x1="148" y1="30" x2="152" y2="30" stroke="#000720"></line>
            <text x="156" y="35">R</text>
            <line x1="148" y1="90" x2="152" y2="90" stroke="#000720"></line>
            <text x="156" y="95">R/2</text>
            <line x1="148" y1="210" x2="152" y2="210" stroke="#000720"></line>
            <text x="156" y="215">-R/2</text>
            <line x1="148" y1="270" x2="152" y2="270" stroke="#000720"></line>
            <text x="156" y="275">-R</text>
            <polygon points="300,150 295,155 295, 145" fill="#000720" stroke="#000720"></polygon>
            <polygon points="150,0 145,5 155,5" fill="#000720" stroke="#000720"></polygon>
            <rect x="150" y="150" width="120" height="60" fill-opacity="0.4" stroke="navy" fill="blue"></rect>
            <polygon points="150,30 150,150 90,150" fill-opacity="0.4" stroke="navy" fill="blue"></polygon>
            <path d="M150 150 L 210 150 C 220 130 200 80 150 90 L Z" fill-opacity="0.4" stroke="navy" fill="blue"></path>
            <circle id="pointer" r="5" cx="150" cy="150" fill-opacity="0.7" fill="red" stroke="firebrick" visibility="hidden"></circle>
        </svg>
        <div id="myForm">
            <div class="insideForm x">
                <label>Выберите X:</label>
                <input required name="X-input" class="illuminated" type="text" placeholder="значение в промежутке (-5 до 3)" maxlength="6">
            </div>
            <div class="insideForm y">    
                <label>Введите Y:</label>
                <input name="Y-button" class="illuminated" type="button" value="-3">
                <input name="Y-button" class="illuminated" type="button" value="-2">
                <input name="Y-button" class="illuminated" type="button" value="-1">
                <input name="Y-button" class="illuminated" type="button" value="0">
                <input name="Y-button" class="illuminated" type="button" value="1">
                <input name="Y-button" class="illuminated" type="button" value="2">
                <input name="Y-button" class="illuminated" type="button" value="3">
                <input name="Y-button" class="illuminated" type="button" value="4">
                <input name="Y-button" class="illuminated" type="button" value="5">
            </div>

            <div class="insideForm r">
                <label>Введите R:</label>
                <input type="text" id="inputR" placeholder="1..4" name="r">
                <input name="R-button" class="illuminated" type="button" value="1">
                <input name="R-button" class="illuminated" type="button" value="2">
                <input name="R-button" class="illuminated" type="button" value="3">
                <input name="R-button" class="illuminated" type="button" value="4">
                <input name="R-button" class="illuminated" type="button" value="5">
            </div>
<%--            <button id="checkButton">Проверить</button>--%>
            <button type="submit" name="submit" id="checkButton" class="submit" tabindex="4" :disabled="isButtonDisabled">Проверить</button>
        </div>
        <?php
        if(array_key_exists('clean',$_GET)){
            session_start();
            session_destroy();
            header('Location: https://se.ifmo.ru/~s284187/index.php');
        }
        ?>
        <form id="myForm2" method="get" action="">
            <input type="submit" name="clean" id="clean" value="Очистить"/>
        </form>
        <br>
        <table id="mainTable">
            <tfoot>
            <tr>
                <td colspan="5" id="outputContainer"><h4><span class="outputStub notification">Результаты отсутствуют</span></h4></td>
            </tr>
            </tfoot>
        </table>

    </div>
    <script src="scripts/validator.js"></script>
    <script src="scripts/easter_egg.js"></script>
    <script src="scripts/graph_drawer.js"></script>
</body>
</html>