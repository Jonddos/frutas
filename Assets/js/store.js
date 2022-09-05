// Proxy que se conecta un componente del front
// Sirve para tener datos reactivos
// reactivos = interactivos
const  { reactive } = Vue
const { createApp } = Vue;
const store = reactive({
  actualUser: {},
  allUsers: [],
  getAllUsers(){
    fetch(`http://localhost/archivos/Proyecto_Fruver_Alterno/api/getAllUsers`)
    .then(response => response.json())
    .then(data =>{
        store.allUsers = data     
    });
  },
  updateUser(){
    //funcion para actualizar datos
    let userId = this.actualUser.id_usuario
    let dataForm = new FormData()
    dataForm.append("userId",userId)
    dataForm.append("data", JSON.stringify(this.actualUser))
    fetch(
        `http://localhost/archivos/Proyecto_Fruver_Alterno/api/updateDataUser`,{
            method: 'POST',
            body: dataForm
        }
    )
    .then(response => {
        this.getAllUsers()
        console.log(response)
        response.json()
    })
    .then(data =>{
      console.log(data)       
    });
      
  },
  deleteUser(){
    //funcion para actualizar datos
    let userId = document.getElementById('delete_user_id').value
    let dataForm = new FormData()
    dataForm.append("userId",userId)
    fetch(
        `http://localhost/archivos/Proyecto_Fruver_Alterno/api/deleteUser`,{
            method: 'POST',
            body: dataForm
        }
    )
    .then(response => {
        this.getAllUsers()
        console.log(response)
        response.json()
    })
    .then(data =>{
        console.log(data)       
    });
      
  }
})