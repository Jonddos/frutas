let modalEditar = document.querySelector('#editarModal');
let modalDelete = document.querySelector('#deleteModal');
modalEditar.addEventListener('show.bs.modal', event => {
    let userId = event.explicitOriginalTarget.getAttribute('user-id');
    fetch(`http://localhost/archivos/Proyecto_Fruver_Alterno/api/getUser.php?userId=${userId}`)
    .then(response => response.json())
    .then(data =>{
        store.actualUser = data
        
    });
}); 

modalDelete.addEventListener('show.bs.modal', event => {
    let userId = event.explicitOriginalTarget.getAttribute('user-id');
    document.getElementById('delete_user_id').value = userId
}); 

  