// Proxy que se conecta un componente del front
// Sirve para tener datos reactivos
// reactivos = interactivos
const  { reactive } = Vue

const store = reactive({
  actualUser: {},
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
        console.log(response)
        response.json()
    })
    // .then(data =>{
    //     console.log(data)       
    // });
      
  }
})