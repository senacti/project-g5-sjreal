// $(function () {
//     $('[data-toggle="tooltip"]').tooltip()
//   })

const tabsArray = Array.from(document.querySelectorAll("#select-tab"))
const contentArray = Array.from(document.querySelectorAll("#selec-content"))

//PAGINASCION QUE SE ESTA USANDO EN INVENTARIO
tabsArray.forEach(tab => {
  tab.addEventListener('click', () => {
    target = tab
    //loopear sobre los elemnontos y quitar el fondo activo 
    tabsArray.forEach(t => {
      t.classList.remove('bg-white')

    })
    const currentTab = tabsArray.indexOf(target)
    contentArray.forEach(content => {
      if (contentArray.indexOf(content) === currentTab) {
        content.classList.remove('hidden')
      } else if (contentArray.indexOf(content) !== currentTab) {
        content.classList.add('hidden')
      }
    })
    target.classList.add('bg-white')

  })
})




//MODAL DETALLE
const tabsArrayopenModalDettalleButton = Array.from(document.querySelectorAll("#openModalDetalle"))
// const openModalDettalleButton = document.getElementById('openModalDetalle');
const closeModalButtons = document.querySelectorAll('.modal-close');
const modal = document.getElementById('modal');
tabsArrayopenModalDettalleButton.forEach(openModalDettalleButton => {
  openModalDettalleButton.addEventListener('click', () => {
    modal.classList.remove('hidden');
  });

  closeModalButtons.forEach((button) => {
    button.addEventListener('click', () => {
      modal.classList.add('hidden');
    });
  });

})





//MODAL EDITAR
const tabsArrayopenModalEditarButton = Array.from(document.querySelectorAll("#openModalEditar"))
// const openModalDettalleButton = document.getElementById('openModalDetalle');
const closeModalEditar = document.querySelectorAll('.modal-close');
const modalEditar = document.getElementById('modalEditar');
tabsArrayopenModalEditarButton.forEach(openModalEditarButton => {
  openModalEditarButton.addEventListener('click', () => {
    modalEditar.classList.remove('hidden');
  });

  closeModalEditar.forEach((button) => {
    button.addEventListener('click', () => {
      modalEditar.classList.add('hidden');
    });
  });

})

//MODAL ELIMINAR 
const tabsArrayopenModalEliminarButton = Array.from(document.querySelectorAll("#openModalEliminar"))
// const openModalDettalleButton = document.getElementById('openModalDetalle');
const closeModalEliminar = document.querySelectorAll('.modal-close');
const modalEliminar = document.getElementById('modalEliminar');
tabsArrayopenModalEliminarButton.forEach(openModalEliminarButton => {
  openModalEliminarButton.addEventListener('click', () => {
    modalEliminar.classList.remove('hidden');
  });

  closeModalEliminar.forEach((button) => {
    button.addEventListener('click', () => {
      modalEliminar.classList.add('hidden');
    });
  });

})

function deleteProduct() {

  const modalMensajeEliminar = document.querySelector("#modalMensajeEliminar")
  const closeModal = document.querySelectorAll('.modal-close');
  // closeModal.addEventListener('click', () => {
    closeModal.classList.add('hidden');
  //  });
  setTimeout(function () {
    modalMensajeEliminar.addEventListener('click', () => {
      modalEliminar.classList.remove('hidden');
    })
  }, 2000);

  // closeModal();
}




//MODAL CREAR
const tabsArrayopenModalCrearButton = Array.from(document.querySelectorAll("#openModalCrear"))  //modalCrear
// const openModalCrearButton = document.getElementById('openModalCrear');
const closeModalCrear = document.querySelectorAll('.modal-close');
const modalCrear = document.getElementById('modalCrear');
tabsArrayopenModalCrearButton.forEach(openModalCrearButton => {
  openModalCrearButton.addEventListener('click', () => {
    modalCrear.classList.remove('hidden');
  });

  closeModalCrear.forEach((button) => {
    button.addEventListener('click', () => {
      modalCrear.classList.add('hidden');
    });
  });

})



