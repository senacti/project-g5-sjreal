const daysContainers = document.querySelectorAll(".days");
const nextBtns = document.querySelectorAll(".next");
const prevBtns = document.querySelectorAll(".prev");
const todayBtns = document.querySelectorAll(".today");
const monthsElements = document.querySelectorAll(".month");
const calendarContainers = document.querySelectorAll(".calendar");
const calendarToggles = document.querySelectorAll(".calendar-toggle");
const dateInputs = document.querySelectorAll(".date-input");

const months = [
  "ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO",
  "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"
];

const days = ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"];

const renderCalendar = (daysContainer, monthElement, currentMonth, currentYear) => {
  const firstDay = new Date(currentYear, currentMonth, 1);
  const lastDay = new Date(currentYear, currentMonth + 1, 0);
  const lastDayIndex = lastDay.getDay();
  const lastDayDate = lastDay.getDate();
  const prevLastDay = new Date(currentYear, currentMonth, 0);
  const prevLastDayDate = prevLastDay.getDate();
  const nextDays = 7 - lastDayIndex - 1;

  monthElement.textContent = `${months[currentMonth]} ${currentYear}`;

  let daysHTML = "";

  for (let x = firstDay.getDay(); x > 0; x--) {
    daysHTML += `<div class="day prev">${prevLastDayDate - x + 1}</div>`;
  }

  for (let i = 1; i <= lastDayDate; i++) {
    if (
      i === new Date().getDate() &&
      currentMonth === new Date().getMonth() &&
      currentYear === new Date().getFullYear()
    ) {
      daysHTML += `<div class="day today">${i}</div>`;
    } else {
      daysHTML += `<div class="day">${i}</div>`;
    }
  }

  for (let j = 1; j <= nextDays; j++) {
    daysHTML += `<div class="day next">${j}</div>`;
  }

  daysContainer.innerHTML = daysHTML;
};

const initializeCalendar = (calendarIndex) => {
  const daysContainer = daysContainers[calendarIndex];
  const nextBtn = nextBtns[calendarIndex];
  const prevBtn = prevBtns[calendarIndex];
  const todayBtn = todayBtns[calendarIndex];
  const monthElement = monthsElements[calendarIndex];
  const calendarContainer = calendarContainers[calendarIndex];
  const dateInput = dateInputs[calendarIndex];

  let date = new Date();
  let currentMonth = date.getMonth();
  let currentYear = date.getFullYear();

  renderCalendar(daysContainer, monthElement, currentMonth, currentYear);

  nextBtn.addEventListener("click", () => {
    currentMonth++;
    if (currentMonth > 11) {
      currentMonth = 0;
      currentYear++;
    }
    renderCalendar(daysContainer, monthElement, currentMonth, currentYear);
  });

  prevBtn.addEventListener("click", () => {
    currentMonth--;
    if (currentMonth < 0) {
      currentMonth = 11;
      currentYear--;
    }
    renderCalendar(daysContainer, monthElement, currentMonth, currentYear);
  });

  todayBtn.addEventListener("click", () => {
    currentMonth = date.getMonth();
    currentYear = date.getFullYear();
    renderCalendar(daysContainer, monthElement, currentMonth, currentYear);
  });

// Agrega clic a los dias 
daysContainer.addEventListener("click", (event) => {
    const selectedDay = event.target.textContent;
     console.log(selectedDay);
    if (selectedDay) {
      const selectedDate = new Date(currentYear, currentMonth, selectedDay);
      const formattedDay = selectedDate.getDate();
      const formattedMonth = months[selectedDate.getMonth()];
      const formattedYear = selectedDate.getFullYear();
      const dateInput = dateInputs[calendarIndex]; 
      const formattedValue = `${formattedYear}\n${formattedDay}\n${formattedMonth}`; //salto de linea 
      dateInput.textContent = formattedValue; 
      calendarContainer.classList.remove("show-calendar");
    }
  });
 
  // muestra o oculta el calendario cuando le doy clik en fecha de ingreso 
  dateInput.addEventListener("click", () => {
    calendarContainer.classList.toggle("show-calendar");
  });
};


for (let i = 0; i < calendarContainers.length; i++) {
  initializeCalendar(i);
}


calendarToggles.forEach((toggle, index) => {
  toggle.addEventListener("click", () => {
    calendarContainers[index].classList.toggle("show-calendar");
  });
});
