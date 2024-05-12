const monthNames = [
    "Enero", "Febrero", "Marzo",
    "Abril", "Mayo", "Junio", "Julio",
    "Agosto", "Septiembre", "Octubre",
    "Noviembre", "Diciembre"
];
// const weekDays = ['Dom', 'Lun', 'Mar', 'Mié', 
// 'Jue', 'Vie', 'Sáb']; // Nombres de los días de la semana
let today = new Date();
let currentYear = today.getFullYear();

// Para el calendario de check-in
let checkInMonth = today.getMonth();
const checkInMonthName = document.getElementById('checkInMonthName');
const checkInDaysContainer = document.getElementById('checkInDays');

// Para el calendario de check-out
let checkOutMonth = today.getMonth();
const checkOutMonthName = document.getElementById('checkOutMonthName');
const checkOutDaysContainer = document.getElementById('checkOutDays');

// weekDays.forEach(day => {
//     const weekday = document.createElement('div');
//     weekday.textContent = day;
//     weekday.classList.add('weekday');
//     weekdaysContainer.appendChild(weekday);
// });

function updateCalendar(month, monthName, daysContainer) {
    let firstDayOfMonth = new Date(currentYear, month, 1).getDay();
    let numDaysInMonth = new Date(currentYear, month + 1, 0).getDate();

    monthName.textContent = monthNames[month] + ' ' + currentYear;

    daysContainer.innerHTML = '';

    for (let i = 0; i < firstDayOfMonth; i++) {
        const emptyDay = document.createElement('button');
        emptyDay.classList.add('day');
        daysContainer.appendChild(emptyDay);
    }

    for (let i = 1; i <= numDaysInMonth; i++) {
        const day = document.createElement('button');
        day.textContent = i;
        day.classList.add('day');
        day.addEventListener('click', () => {
            selectDate(i, month, daysContainer);
        });
        daysContainer.appendChild(day);
    }
}

function selectDate(day, month, daysContainer) {
    const selectedDate = new Date(currentYear, month, day);
    const selectedDateString = selectedDate.toDateString();

    // Resetear estilos
    const allDays = daysContainer.querySelectorAll('.day');
    allDays.forEach(day => day.classList.remove('selected'));

    // Marcar el día seleccionado
    const selectedDay = daysContainer.querySelector(`.day:nth-child(${day + 1})`);
    selectedDay.classList.add('selected');

    // Aquí puedes realizar más acciones con la fecha seleccionada, como enviarla al servidor, etc.
    console.log(selectedDateString);
}

updateCalendar(checkInMonth, checkInMonthName, checkInDaysContainer);
updateCalendar(checkOutMonth, checkOutMonthName, checkOutDaysContainer);