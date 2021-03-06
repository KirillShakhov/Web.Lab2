# Web.Lab2

[![GitHub stars][stars-shield]][stars-url]
[![GitHub issues][issues-shield]][issues-url]
[![GitHub][license-shield]][license-url]
![GitHub repo size](https://img.shields.io/github/repo-size/KirillShakhov/Web.Lab2)
![GitHub last commit](https://img.shields.io/github/last-commit/KirillShakhov/Web.Lab2)

Variant 282301

![pic](https://github.com/KirillShakhov/Web.Lab2/blob/main/img/pic.jpeg)

**Разработать веб-приложение на базе сервлетов и JSP, определяющее попадание точки на координатной плоскости в заданную область.**
____
Приложение должно быть реализовано в соответствии с шаблоном MVC и состоять из следующих элементов:

* **ControllerServlet** , определяющий тип запроса, и, в зависимости от того, содержит ли запрос информацию о координатах точки и радиусе, делегирующий его обработку одному из перечисленных ниже компонентов. Все запросы внутри приложения должны передаваться этому сервлету (по методу GET или POST в зависимости от варианта задания), остальные сервлеты с веб-страниц напрямую вызываться не должны.
* **AreaCheckServlet**, осуществляющий проверку попадания точки в область на координатной плоскости и формирующий HTML-страницу с результатами проверки. Должен обрабатывать все запросы, содержащие сведения о координатах точки и радиусе области.
* **Страница JSP**, формирующая HTML-страницу с веб-формой. Должна обрабатывать все запросы, не содержащие сведений о координатах точки и радиусе области.

**Разработанная страница JSP должна содержать:**

1. "Шапку", содержащую ФИО студента, номер группы и номер варианта.
1. Форму, отправляющую данные на сервер.
1. Набор полей для задания координат точки и радиуса области в соответствии с вариантом задания.
1. Сценарий на языке JavaScript, осуществляющий валидацию значений, вводимых пользователем в поля формы.
1. Интерактивный элемент, содержащий изображение области на координатной плоскости (в соответствии с вариантом задания) и реализующий следующую функциональность:
   1. Если радиус области установлен, клик курсором мыши по изображению должен обрабатываться JavaScript-функцией, определяющей координаты точки, по которой кликнул пользователь и отправляющей полученные координаты на сервер для проверки факта попадания.
   1. В противном случае, после клика по картинке должно выводиться сообщение о невозможности определения координат точки.
   1. После проверки факта попадания точки в область изображение должно быть обновлено с учётом результатов этой проверки (т.е., на нём должна появиться новая точка).
1. Таблицу с результатами предыдущих проверок. Список результатов должен браться из контекста приложения, HTTP-сессии или Bean-компонента в зависимости от варианта.

**Страница, возвращаемая AreaCheckServlet, должна содержать:**

1. Таблицу, содержащую полученные параметры.
2. Результат вычислений - факт попадания или непопадания точки в область.
3. Ссылку на страницу с веб-формой для формирования нового запроса.

Разработанное веб-приложение необходимо развернуть на сервере WildFly. Сервер должен быть запущен в standalone-конфигурации, порты должны быть настроены в соответствии с выданным portbase, доступ к http listener'у должен быть открыт для всех IP.

____
**Вопросы к защите лабораторной работы:**
1. Java-сервлеты. Особенности реализации, ключевые методы, преимущества и недостатки относительно CGI и FastCGI.
2. Контейнеры сервлетов. Жизненный цикл сервлета.
3. Диспетчеризация запросов в сервлетах. Фильтры сервлетов.
4. HTTP-сессии - назначение, взаимодействие сервлетов с сессией, способы передачи идентификатора сессии.
5. Контекст сервлета - назначение, способы взаимодействия сервлетов с контекстом.
6. JavaServer Pages. Особенности, преимущества и недостатки по сравнению с сервлетами, область применения.
7. Жизненный цикл JSP.
8. Структура JSP-страницы. Комментарии, директивы, объявления, скриптлеты и выражения.
9. Правила записи Java-кода внутри JSP. Стандартные переменные, доступные в скриптлетах и выражениях.
10. Bean-компоненты и их использование в JSP.
11. Стандартные теги JSP. Использование Expression Language (EL) в JSP.
12. Параметры конфигурации JSP в дескрипторе развёртывания веб-приложения.
13. Шаблоны проектирования и архитектурные шаблоны. Использование в веб-приложениях.
14. Архитектура веб-приложений. Шаблон MVC. Архитектурные модели Model 1 и Model 2 и их реализация на платформе Java EE.

## Как задеплоить лабу?(WildFly)

1. Установка [WildFly](https://github.com/KirillShakhov/Web.Lab2/blob/main/guides/install-wildfly.md#установка-wildfly-на-helios)
1. [Деплой](https://github.com/KirillShakhov/Web.Lab2/blob/main/guides/install-wildfly.md#deployment) лабы
1. [Проброс портов](https://github.com/KirillShakhov/Web.Lab2/blob/main/guides/install-wildfly.md#проброс-портов) для гелиоса
1. Запуск в [фоновом режиме](https://github.com/KirillShakhov/Web.Lab2/blob/main/guides/install-wildfly.md#запуск-в-фоне)
1. Установка вашего [portbase](https://github.com/KirillShakhov/Web.Lab2/blob/main/guides/install-wildfly.md#установка-portbase)
1. Установка [datasource](https://github.com/KirillShakhov/Web.Lab2/blob/main/guides/set-wildfly-datasource.md)


## Как задеплоить лабу?(glassfish)

1. Создаём домен для лабы:
`$ asadmin create-domain --domaindir ~/glass --portbase 41414 lab2`
где:
    * `~/glass` -- путь до каталога, где вы хотите разместить свою лабу;
    * `41414` - число, от которого будут отсчитываться номера портов созданного домена. Проявите фантазию в выборе, чтоб не пересечься с другими студентами;
    * `lab2` - название католога для веб-приложения (лабы).

    Сервер будет сконфигурирован. Заскриньте терминал: эти данные вам ещё понадобятся. Примерный вывод:
```
Using port 41462 for Admin.
Using port 41494 for HTTP Instance.
Using port 41490 for JMS.
Using port 41451 for IIOP.
Using port 41495 for HTTP_SSL.
Using port 41452 for IIOP_SSL.
Using port 41453 for IIOP_MUTUALAUTH.
Using port 41500 for JMX_ADMIN.
Using port 41480 for OSGI_SHELL.
Using port 41423 for JAVA_DEBUGGER.
```
2. Запускаем созданный домен:
`$ asadmin start-domain --domaindir ~/glass lab2`
(проверить его статус можно командой: `$ asadmin list-domains --domaindir ~/glass`)
3. Так-как домены Glassfish недоступны снаружи, то необходимо пробросить порты через SSH-туннель. Заходим в консоль с своей машины и вводим:
`ssh -fNL 41462:127.0.0.1:41462 имяПользователяр@se.ifmo.ru -p 2222`
После этого заходим на [127.0.0.1:41462] в браузере - должна отобразиться страница с приветствием Glassfish.
4. Логинимся, деплоим приложение на вкладке **application** и пробрасывет порт для него (повторить пункт 3 с портом HTTP Instance).

Другие команды:
`$ asadmin stop-domain --domaindir ~/glass lab2` - остановить домен
`$ asadmin delete-domain --domaindir ~/glass lab2` - удалить домен

[stars-shield]: https://img.shields.io/github/stars/KirillShakhov/Web.Lab2?style=social
[stars-url]: https://github.com/KirillShakhov/Web.Lab2/stargazers
[issues-shield]: https://img.shields.io/github/issues/KirillShakhov/Web.Lab2
[issues-url]: https://github.com/KirillShakhov/Web.Lab2/issues
[license-shield]: https://img.shields.io/github/license/KirillShakhov/Web.Lab2
[license-url]: https://github.com/KirillShakhov/Web.Lab2/blob/master/LICENSE
