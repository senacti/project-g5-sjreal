// $(function () {
//     $('[data-toggle="tooltip"]').tooltip()
//   })

const tabsArray = Array.from(document.querySelectorAll("#select-tab"))
const contentArray = Array.from(document.querySelectorAll("#selec-content"))

tabsArray.forEach(tab => {
  tab.addEventListener('click', () => {
    target = tab
    //loopear sobre los elemnontos y quitar el fondo activo 
    tabsArray.forEach(t => {
      t.classList.remove('bg-white')

    })
    const currentTab = tabsArray.indexOf(target)
    contentArray.forEach(content=> {
      if(contentArray.indexOf(content) === currentTab ){
        content.classList.remove('hidden')
      }else if(contentArray.indexOf(content) !== currentTab){
        content.classList.add('hidden')
      }
    })
    target.classList.add('bg-white')

  })
})
console.log(tabsArray)
console.log(contentArray)

//modal
const openModalDettalleButton = document.getElementById('openModalDetalle');
const closeModalButtons = document.querySelectorAll('.modal-close');
const modal = document.getElementById('modal');

openModalDettalleButton.addEventListener('click', () => {
    modal.classList.remove('hidden');
});

closeModalButtons.forEach((button) => {
    button.addEventListener('click', () => {
        modal.classList.add('hidden');
    });
});

// const openModalEditButton = document.getElementById('openModalDetalle');
// const closeModalButtons = document.querySelectorAll('.modal-close');
// const modal = document.getElementById('modal');

// openModalEditButton.addEventListener('click', () => {
//     modal.classList.remove('hidden');
// });

// closeModalButtons.forEach((button) => {
//     button.addEventListener('click', () => {
//         modal.classList.add('hidden');
//     });
// });


// const openModalEliminarButton = document.getElementById('openModalDetalle');
// const closeModalButtons = document.querySelectorAll('.modal-close');
// const modal = document.getElementById('modal');

// openModalEliminarButton.addEventListener('click', () => {
//     modal.classList.remove('hidden');
// });

// closeModalButtons.forEach((button) => {
//     button.addEventListener('click', () => {
//         modal.classList.add('hidden');
//     });
// });