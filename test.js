/*Seleccion de elementos relevantes */
const checkInDate = document.getElementById('date-check-in');
const checkInTime = document.getElementById('time-check-in');
const checkOutDate = document.getElementById('date-check-out');
const checkOutTime = document.getElementById('time-check-out');
const amountAdults = document.querySelectorAll('#num-adults');
const amountChildren = document.querySelectorAll('#num-children');
const msgControl = document.querySelectorAll('.msg-ctrl')


addEventListener('DOMContentLoaded', () => {
    checkInDate.value = initiateDate();
    checkOutDate.value = initiateDateCheckOut();
})

checkOutDate.addEventListener('change', (e) => { 
    validateDates(toDate(checkInDate.value), toDate(checkOutDate.value));
    toggle(validateDates(toDate(checkInDate.value), toDate(checkOutDate.value)), msgControl, 'msg-ctrl--valid', 'msg-ctrl--invalid')
})

function initiateDate() {
    let today = new Date();
    let day = today.getDate();
    let month = today.getMonth()+1;
    let year = today.getFullYear();
    let date = `${year}-${month<10? "0"+month : month}-${day<10? "0"+day : day}`;
    return date;
}

function initiateDateCheckOut() {
    let today = new Date();
    let day = today.getDate()+1;
    let month = today.getMonth()+1;
    let year = today.getFullYear();
    let date = `${year}-${month<10? "0"+month : month}-${day<10? "0"+day : day}`;
    return date;
}

function validateDates(checkIn, checkOut) {
    if (checkIn >= checkOut) {
        return false
    } else {
        return true
    }
}

function toDate(string) {
    let arr = string.split("-");
    let year = arr[0];
    let month = arr[1]-1;
    let day = arr[2];
    
    let date = new Date(year, month, day);
    return date;
}

function toggle(condition, target, classValid, classInvalid) {
    if (condition) {
        target.classList.add(classValid)
        target.classList.remove(classInvalid)
    } else {
        target.classList.add(classInvalid)
        target.classList.remove(classValid)
    }
}


