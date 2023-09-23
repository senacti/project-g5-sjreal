$(document).ready(function() {
    $('#calendar').fullCalendar({
        selectable: true, // Permite seleccionar fechas
        select: function(start, end) {
            // Acción que ocurre al seleccionar una fecha
            var checkIn = start.format('YYYY-MM-DD');
            var checkOut = end.format('YYYY-MM-DD');
            
            // Actualizar los campos de entrada de fecha
            $('#check-in').val(checkIn);
            $('#check-out').val(checkOut);
        }
    });
});

