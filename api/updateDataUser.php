<?php
    // Pasar un string con un json para tranformarlo a objeto

    if(isset($_POST['userId'])){
        $userID = $_POST["userId"];
        $data=json_decode($_POST["data"]);
        // echo $data->ejemplo;
        require_once("../conexion.php");
        $query= "UPDATE `usuarios` SET `id_usuario`='{$userID}',`tipoDoc_usuario`='{$data->tipoDoc_usuario}',`identificacion_usuario`='{$data->identificacion_usuario}',`nombre_usuario`='{$data->nombre_usuario}',`apellido_usuario`='{$data->apellido_usuario}',`correo_usuario`='{$data->correo_usuario}',`telefono_usuario`='{$data->telefono_usuario}',`direccion_usuario`='{$data->direccion_usuario}',`contraseña_usuario`='{$data->contraseña_usuario}',`estatus`='{$data->estatus}',`rol_id`='{$data->rol_id}' WHERE `id_usuario`='{$userID}'";


        $leer = $conexion->prepare($query);
        if ($leer->execute()){
            $response=array("estatus"=>true);
        }
        else{
            $response=array("estatus"=>false);
            // var_dump($leer->errorInfo());
        }
        echo json_encode($response,JSON_UNESCAPED_UNICODE);
        
    }else{
        echo "{}";
    }
?>

