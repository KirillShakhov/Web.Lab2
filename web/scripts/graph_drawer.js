"use strict";

let svg = document.querySelector("svg");

document.addEventListener("DOMContentLoaded", () => {
    svg.addEventListener("click", (event) => {
        if (validateR()) {
            let position = getMousePosition(svg, event);
            x = position.x;
            y = position.y;
            setPointer(position.x_draw, position.y_draw);
            let k = 120/ r; //отношение радиуса и плоскости
            x = (x / k).toFixed(1);
            y = (y / k).toFixed(1);

            sendRequest("svg");
        }
    });
});

function getMousePosition(svg, event) {
    let rect = svg.getBoundingClientRect();
    return {
        x: event.clientX - (rect.left+150),
        y: (event.clientY - (rect.top+150))*-1,
        x_draw: event.clientX - rect.left,
        y_draw: event.clientY - rect.top
    };
}

function setPointer(x, y) {
    console.log(x + " " + y);
    svg.insertAdjacentHTML("beforeend", `<circle r="5" cx="${x}" cy="${y}" fill-opacity="0.7" fill="red" stroke="firebrick"></circle>`);
}