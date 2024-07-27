
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new Calendar(calendarEl, {
        plugins: [ dayGridPlugin ],
        initialView: 'dayGridMonth',
        selectable: true,
        dateClick: function(info) {            
            console.log('Clicked on: ' + info.dateStr);
        },
        select: function(info) {            
            console.log('Selected: ' + info.startStr + ' to ' + info.endStr);
        }
    });

    calendar.render();

});
