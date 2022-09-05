<?php

require_once('conexion.php');
$sql = "SELECT u.*, r.* from usuarios u inner join roles r on u.rol_id = r.id_rol;";
$traerInfo = $conexion->prepare($sql);
$traerInfo->execute();
$leer = $traerInfo->fetchAll(PDO::FETCH_ASSOC);

var_dump($leer);

?>




<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fruver Xpress</title>

    <!-- Conexión con boostrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <!-- Conexión con CSS -->
    <link rel="stylesheet" href="CSS/Estilo.css">

    <!-- Fuentes de Google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Open+Sans&family=Oswald:wght@200;300;400;500;600;700&family=Roboto:ital,wght@0,100;1,100&display=swap" rel="stylesheet">


</head>

<body>
    <div >
        <!-- Codigo para el header -->
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-fruver">
                <div class="container">
                    <a href="index.html"><img src="Multimedia/logo-carrito.png" alt="logo carrito"></a>
                    <a href="index.html">
                        <h2>Fruver Xpress</h2>
                    </a>
                    <!-- Solo se muestra cuando es diseño Responsive -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse collapse-fruver" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#servicios">Servicios</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#categorias">Categorias</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#contacts">Perfil</a>
                            </li>
                        </ul>
                    </div>
                    <a href="logOut.php">Cerrar Sesion</a>
                </div>
            </nav>


        </header>
        <!-- Codigo para el main -->
        <main>
            <div class="container">
                <table class="table table-hover">
                    <tr class="table-success">
                        <th>tipoDoc_usuario</th>
                        <th>identificacion_usuario</th>
                        <th>nombre_usuario</th>
                        <th>apellido_usuario</th>
                        <th>correo_usuario</th>
                        <th>telefono_usuario</th>
                        <th>direccion_usuario</th>
                        <th>estatus</th>
                        <th>Tipo Rol</th>
                    </tr>
                    <tr>
                        <?php
                        for ($i = 0; $i < count($leer); $i++) {
                            $estado = $leer[$i]['estatus'];
                            if ($estado == 0) {
                                $estado = 'inactivo';
                            } else {
                                $estado = 'Activo';
                            }
                        }
                        foreach ($leer as $key => $datos) : ?>
                            <td><?= $datos['tipoDoc_usuario'] ?></td>
                            <td><?= $datos['identificacion_usuario'] ?></td>
                            <td><?= $datos['nombre_usuario'] ?></td>
                            <td><?= $datos['apellido_usuario'] ?></td>
                            <td><?= $datos['correo_usuario'] ?></td>
                            <td><?= $datos['telefono_usuario'] ?></td>
                            <td><?= $datos['direccion_usuario'] ?></td>
                            <td><?= $estado ?></td>
                            <td><?= $datos['nombre_rol'] ?></td>
                            <td>
                                <button user-id="<?= $datos['id_usuario'] ?>" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editarModal">Editar</button>
                            </td>
                    </tr>
                <?php endforeach; ?>
                </table>
            </div>


        </main>

        <!-- Codigo para el Footer -->
        <footer>
            <div class="container">
                <div id="contacts">
                    <ul>
                        <h2>Categorias</h2>
                        <li><a href="#">
                                <p>Aseo</p>
                            </a></li>
                        <li><a href="frutas.html">
                                <p>Frutas y verduras</p>
                            </a></li>
                        <li><a href="#">
                                <p>Granos</p>
                            </a></li>
                        <li><a href="#">
                                <p>Huevos y lacteos</p>
                            </a></li>
                        <li><a href="#">
                                <p>Licores</p>
                            </a></li>
                        <li><a href="#">
                                <p>Mecato</p>
                            </a></li>
                    </ul>
                    <ul>
                        <li>
                            <h2>Contacto</h2>
                            <a href="#">
                                <p>darizaduarte@gmail.com</p>
                            </a>
                            <a href="#">
                                <p>calle 188 15a 47</p>
                            </a>
                            <a href="#">
                                <p> 2022 Derechos reservados</p>
                            </a>
                        <li>

                        </li>
                    </ul>

                    <ul>
                        <li>
                            <h2>Redes sociales</h2>
                            <div class="iconosimg">
                                <a href="https://www.whatsapp.com/?lang=es"><img src="Multimedia/whatsapp.png" alt=""></a>
                                <a href="https://www.instagram.com/"><img src="Multimedia/Instagram.png" alt=""></a>
                                <a href="https://es-la.facebook.com
                                    "><img src="Multimedia/facebook.png" alt=""></a>
                            </div>
                        </li>
                        <li>

                        </li>
                    </ul>
                </div>
        </footer>
    </div>
    <!-- Codigo para el modal -->
    <div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" id="userApp">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <?php

                    require_once('conexion.php');
                    $sql = "SELECT u.*, r.* from usuarios u inner join roles r on u.rol_id = r.id_rol;";
                    $traerInfo = $conexion->prepare($sql);
                    $traerInfo->execute();
                    $leer = $traerInfo->fetchAll(PDO::FETCH_ASSOC);

                    ?>
                    <form>
                        <input type="hidden" value="">
                        <div class="row">
                            <div class="col-md-6 mb-6">
                                <label for="tipoDoc_usuario" class="form-label">Número de Documento</label>
                                <input type="text" class="form-control" id="numDoc" aria-describedby="emailHelp" name="numDoc" v-model="store.actualUser.identificacion_usuario">
                            </div>
                            
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-6">
                                <label for="nombre_usuario" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nombre_usuario" aria-describedby="emailHelp" name="nombre_usuario" v-model="store.actualUser.nombre_usuario"> <!-- v-model es sintaxis de vue para conectar datos de forma dinamica -->
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="apellido_usuario" class="form-label">Apellido</label>
                                <input type="text" class="form-control" id="apellido_usuario" aria-describedby="emailHelp" name="apellido_usuario" v-model="store.actualUser.apellido_usuario">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-6">
                                <label for="telefono_usuario" class="form-label">Telefono</label>
                                <input type="text" class="form-control" id="telefono_usuario" aria-describedby="emailHelp" name="telefono_usuario" v-model="store.actualUser.telefono_usuario">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="direccion_usuario" class="form-label">Direccion</label>
                                <input type="text" class="form-control" id="direccion_usuario" aria-describedby="emailHelp" name="direccion_usuario" v-model="store.actualUser.direccion_usuario">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-6">
                                <label for="correo_usuario" class="form-label">correo</label>
                                <input type="email" class="form-control" id="correo_usuario" aria-describedby="emailHelp" name="correo_usuario" v-model="store.actualUser.correo_usuario">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="direccion_usuario" class="form-label">estado</label>
                                <input type="text" class="form-control" id="estado_usuario" aria-describedby="emailHelp" name="estado_usuario" v-model="store.actualUser.estatus">
                            </div>
                        </div>
                        <div class="row mb-3">
                                <label for="doc_usuario" class="form-label">Rol</label>
                                <select name="rolUsuario" id="rolUsuario" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" v-model="store.actualUser.rol_id">
                                    <option disabled value="">Please select one</option>
                                    <?php
                                    require_once('conexion.php');
                                    $sql = "SELECT * from roles;";
                                    $traerRol = $conexion->prepare($sql);
                                    $traerRol->execute();
                                    $leerRol = $traerRol->fetchAll(PDO::FETCH_ASSOC);

                                    foreach ($leerRol as $key => $datos) {
                                        echo "<option value='{$datos['id_rol']}'>{$datos['nombre_rol']}</option>";
                                    }

                                    ?>
                                </select>
                            </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-success">Actualizar Usuario</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Javascript Antes de cerrar el body-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="Assets/js/vue/vue.js" type="text/javascript"></script>
    <script src="Assets/js/store.js" type="text/javascript"></script>
    <script src="Assets/js/editar.js" type="text/javascript"></script>
    <script src="Assets/js/components/user_component.js" type="text/javascript"></script>
</body>

</html>