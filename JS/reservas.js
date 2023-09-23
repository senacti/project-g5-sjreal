document.addEventListener('DOMContentLoaded', function () {
    // Selecciona el contenedor del calendario por su ID
    var calendarEl = document.getElementById('calendario1');

    // Inicializa FullCalendar en el contenedor seleccionado
    var calendar = new FullCalendar.Calendar(calendarEl, {
        // Configuración y opciones del calendario aquí
        // Por ejemplo, eventos, vista inicial, etc.
    });

    // Renderiza el calendario
    calendar.render();
});

document.addEventListener('DOMContentLoaded', function () {
    // Selecciona el contenedor del calendario por su ID
    var calendarEl = document.getElementById('calendario2');

    // Inicializa FullCalendar en el contenedor seleccionado
    var calendar = new FullCalendar.Calendar(calendarEl, {
        // Configuración y opciones del calendario aquí
        // Por ejemplo, eventos, vista inicial, etc.
    });

    // Renderiza el calendario
    calendar.render();
});

