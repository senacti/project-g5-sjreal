/*Seleccion fechas y horas de llegada y salida */
document.addEventListener('DOMContentLoaded', () => {
    const dateCheckIn = document.getElementById('date-check-in');
    const dateCheckOut = document.getElementById('date-check-out');
    const checkInError = document.querySelector('#li-check-in .msg-ctrl');
    const checkOutError = document.querySelector('#li-check-out .msg-ctrl');

    const numAdults = document.getElementById('num-adults');
    const numChildren = document.getElementById('num-children');
    const adultsError = document.querySelector('[for="num-adults"] + .msg-ctrl');
    const childrenError = document.querySelector('[for="num-children"] + .msg-ctrl');

    const numCoupleRoom = document.getElementById('num-couple-room');
    const numSingleRoom = document.getElementById('num-single-room');
    const numMultipleRoom = document.getElementById('num-multiple-room');
    const coupleRoomError = document.querySelector('[for="num-couple-room"] + .msg-ctrl');
    const singleRoomError = document.querySelector('[for="num-single-room"] + .msg-ctrl');
    const multipleRoomError = document.querySelector('[for="num-multiple-room"] + .msg-ctrl');

    const form = document.getElementById('form');

    const validateDates = () => {
        const checkInDate = new Date(dateCheckIn.value);
        const checkOutDate = new Date(dateCheckOut.value);

        if (checkInDate && checkOutDate && checkInDate > checkOutDate) {
            dateCheckIn.classList.add('border--invalid');
            dateCheckOut.classList.add('border--invalid');
            checkInError.classList.add('active');
            checkOutError.classList.add('active');
            return false;
        } else {
            dateCheckIn.classList.remove('border--invalid');
            dateCheckOut.classList.remove('border--invalid');
            checkInError.classList.remove('active');
            checkOutError.classList.remove('active');
            return true;
        }
    };

    

    const validateRooms = () => {
        if (numCoupleRoom.value < 0 && numSingleRoom.value < 0 && numMultipleRoom.value < 0) {
            numCoupleRoom.classList.add('border--invalid');
            numSingleRoom.classList.add('border--invalid');
            numMultipleRoom.classList.add('border--invalid');
            coupleRoomError.classList.add('active');
            singleRoomError.classList.add('active');
            multipleRoomError.classList.add('active');
            return false;
        } else {
            numCoupleRoom.classList.remove('border--invalid');
            numSingleRoom.classList.remove('border--invalid');
            numMultipleRoom.classList.remove('border--invalid');
            coupleRoomError.classList.remove('active');
            singleRoomError.classList.remove('active');
            multipleRoomError.classList.remove('active');
            return true;
        }
    };

    dateCheckIn.addEventListener('input', validateDates);
    dateCheckOut.addEventListener('input', validateDates);
    numAdults.addEventListener('input', validatePeople);
    numChildren.addEventListener('input', validatePeople);
    numCoupleRoom.addEventListener('input', validateRooms);
    numSingleRoom.addEventListener('input', validateRooms);
    numMultipleRoom.addEventListener('input', validateRooms);

    form.addEventListener('submit', (event) => {
        const datesValid = validateDates();
        const roomsValid = validateRooms();
        
        if (!datesValid || !roomsValid) {
            event.preventDefault();
            alert('Por favor, corrige los errores en el formulario.');
        }
    });
});

/*Funciones para inicializar fechas*/
function initiateDate() {
    let today = new Date();
    let day = today.getDate();
    let month = today.getMonth() + 1;
    let year = today.getFullYear();
    let date = `${year}-${month < 10 ? "0" + month : month}-${day < 10 ? "0" + day : day}`;
    return date;
}

function initiateDateCheckOut() {
    let today = new Date();
    let day = today.getDate() + 1;
    let month = today.getMonth() + 1;
    let year = today.getFullYear();
    let date = `${year}-${month < 10 ? "0" + month : month}-${day < 10 ? "0" + day : day}`;
    return date;
}

function validateDates(checkIn, checkOut) {
    if (checkIn >= checkOut) {
        return false
    } else {
        return true
    }
}



