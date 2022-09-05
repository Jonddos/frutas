console.log('Buenas noches Pequeños');

let modalEditar = document.querySelector('#editarModal');
modalEditar.addEventListener('show.bs.modal', event => {
    let userId = event.explicitOriginalTarget.getAttribute('user-id');
    fetch(`http://localhost/archivos/Proyecto_Fruver_Alterno/api/getUser.php?userId=${userId}`)
    .then(response => response.json())
    .then(data =>{
        store.actualUser = data
        
    });
}); 

  