<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="ru-RU">
<head>
  <link href="stylesheets/main_page.css" rel="stylesheet">
  <link href="stylesheets/check_button.css" rel="stylesheet">
  <link rel="icon" type="image/jpg" href="images/favicon.jpg">
  <title>Лабораторная №2</title>
</head>
<body>


<header class="header">
  <h1>Веб-программирование, Лаб. 2, Вариант 282301</h1>
  <h2 align="left">Шахов Кирилл Андревич(back)</h2>
  <h2>Федоров Никита Сергеевич(front)</h2>
</header>


<table id="mainTable" class="shaded">


  <thead><td colspan="5"><h3>Валидация введённых значений:</h3></td></thead>


  <tbody>
  <tr><td colspan="5"><hr></td></tr>




  <tr>
    <td>Выберите X:</td>
    <td><input required name="X-input" class="illuminated" type="text" placeholder="значение в промежутке (-5 до 3)" maxlength="6"></td>
  </tr>
  <tr>
    <td>Введите Y:</td>
    <td><input name="Y-button" class="illuminated" type="button" value="-3"></td>
    <td><input name="Y-button" class="illuminated" type="button" value="-2"></td>
    <td><input name="Y-button" class="illuminated" type="button" value="-1"></td>
    <td><input name="Y-button" class="illuminated" type="button" value="0"></td>
    <td><input name="Y-button" class="illuminated" type="button" value="1"></td>
    <td><input name="Y-button" class="illuminated" type="button" value="2"></td>
    <td><input name="Y-button" class="illuminated" type="button" value="3"></td>
    <td><input name="Y-button" class="illuminated" type="button" value="4"></td>
    <td><input name="Y-button" class="illuminated" type="button" value="5"></td>
  </tr>

  <tr>
    <td>Введите R:</td>
    <td><input name="R-button" class="illuminated" type="button" value="1"></td>
    <td><input name="R-button" class="illuminated" type="button" value="2"></td>
    <td><input name="R-button" class="illuminated" type="button" value="3"></td>
    <td><input name="R-button" class="illuminated" type="button" value="4"></td>
    <td><input name="R-button" class="illuminated" type="button" value="5"></td>
  </tr>





  <tr>
    <td>
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
        <rect x="90" y="30" width="60" height="120" fill-opacity="0.4" stroke="navy" fill="blue"></rect>
        <polygon points="150,150 270,150 150,270" fill-opacity="0.4" stroke="navy" fill="blue"></polygon>
        <path d="M150 150 L 210 150 C 220 130 200 80 150 90 L Z" fill-opacity="0.4" stroke="navy" fill="blue"></path>
        <circle id="pointer" r="5" cx="150" cy="150" fill-opacity="0.7" fill="red" stroke="firebrick" visibility="hidden"></circle>
      </svg>
    </td>
  </tr>















  <tr>
    <td colspan="5">
      <button id="checkButton">Проверить</button>
      <hr>
    </td>
  </tr>
  </tbody>
  <tfoot>
  <tr>
    <td colspan="5" id="outputContainer"><h4><span class="outputStub notification">Результаты отсутствуют</span></h4></td>
  </tr>
  </tfoot>
</table>
<script src="scripts/validator.js"></script>
<script src="scripts/easter_egg.js"></script>
<script src="scripts/graph_drawer.js"></script>
</body>
</html>