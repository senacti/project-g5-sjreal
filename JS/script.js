var swiper = new Swiper(".mySwiper",{
    slidesPerView:1,
    centeredSlides:true,
    loop:true,
    spaceBetween: 30,
    grabCursor:true,
    navigation:{
        nextEL:'.swipper-button-next',
        prevEL:'.swipper-button-prev'
    },
breakpoints:{
    991:{
        slidesPerView: 3
    }
}

});