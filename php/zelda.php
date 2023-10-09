<?php
    session_start();
    include "./datos.php";
    $root="https://www.hoby.es";
    $from="adminHOB@hoby.es";

    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization');
    header("Access-Control-Allow-Credentials: true");
    header('Content-Type: application/json');
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method == "OPTIONS") {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
        header("HTTP/1.1 200 OK");
        die();
    }

    $conexion=new mysqli($host,$usuario,$password,$bbdd);

    /* Variable globales */
    $array=[];
    $aux=0;
    $conexion=new mysqli($host,$usuario,$password,$bbdd);

    if(!$conexion){
        echo "No se ha podido establecer la conexion";
    }else{
        $op=$_GET['opcion'];

        /* Entrada Usuario */
        if($op=="entrar"){
            $usuario=$_GET['correo'];
            $key=$_GET['key'];


            $resultado=mysqli_query($conexion,"SELECT * FROM usuarios WHERE CORREO='".$usuario."'");

            while($fila=mysqli_fetch_row($resultado)){
                if(password_verify($key,$fila[1])){
                    $array[0]=[$fila[0]];
                }else{
                    $array[0]="error";
                }
            }
            if($array[0]==''){
                $array[0]=0;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);

        }//op de entrada del usuario

        /* Registro de usuario */
        if($op=="registro"){
            $usuario=$_GET['correo'];
            $key=$_GET['key'];

            $resultado=mysqli_query($conexion,"SELECT correo FROM usuarios");

            while($fila=mysqli_fetch_row($resultado)){
                $array[$aux]=[$fila[0]];
                $aux++;
            }

            if(!in_array($usuario,$array)){
                $pass=password_hash($key,PASSWORD_DEFAULT);
                $insercion=mysqli_query($conexion,"INSERT INTO usuarios (CORREO, CONTRASEÑA)
                    VALUES('".$usuario."','".$pass."')");
                echo mysqli_error($conexion);
                $resultado=1;
            }else{
                $resultado=0;
            }//compruebo si esta el correo en la bbdd

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($resultado);
        }

        /* opcion Regiones */
        if($op=="regiones"){
            $resultado=mysqli_query($conexion,"SELECT * FROM regiones");

            while($fila=mysqli_fetch_row($resultado)){
                $array[$aux]=[$fila[0],$fila[1],$fila[2],$fila[3],$fila[4]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }//opcion para sacar las regiones

        /* Santuarios completados */
        if($op=="completadoUsuario"){
            $usuario=$_GET['correo'];

            if($usuario!="anonimo"){
                $array=mysqli_query($conexion,"SELECT COUNT(*) FROM completados WHERE correo='".$usuario."'");
            }
            
            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        
        /* Santuarios completados por zonas */
        if($op=="realizados"){
            $usuario=$_GET['correo'];
            $zona=$_GET['zona'];

            if($usuario!="anonimo"){
                $array=mysqli_fetch_row(mysqli_query($conexion,"SELECT COUNT(*) FROM completados WHERE correo='".$usuario."' AND COD_SANTUARIO IN 
            (SELECT COD_SANTUARIO FROM santuarios WHERE COD_REGION='".$zona."')"));
            }
            

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* Santuarios por zonas */
        if($op=="santuariosZona"){
            $zona=$_GET['zona'];

            $resultado=mysqli_query($conexion,"SELECT NOMBRE, GUIA FROM santuarios WHERE cod_region='".$zona."'");

            while($fila=mysqli_fetch_row($resultado)){
                $array[$aux]=[$fila[0],$fila[1]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* consultar el nombre de santuarios completados */
        if($op=="completados"){
            $usuario=$_GET['correo'];
            $zona=$_GET['zona'];
            $resultado=0;

            if($usuario!="anonimo"){
                $resultado=mysqli_query($conexion,"SELECT NOMBRE FROM santuarios WHERE COD_SANTUARIO IN (SELECT COD_SANTUARIO FROM completados WHERE CORREO='".$usuario."') AND COD_REGION='".$zona."'");
                while($fila=mysqli_fetch_row($resultado)){
                    $array[$aux]=[$fila[0]];
                    $aux++;
                }
            }
            
            

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* insertar un templo completado */
        if($op=="insertar"){
            $usuario=$_GET['correo'];
            $santuario=$_GET['numero'];
            $centinela=false;

            if($usuario!="anonimo"){
                $completados=mysqli_query($conexion,"SELECT cod_santuario FROM completados WHERE correo='".$usuario."'");
                while($fila=mysqli_fetch_row($completados)){
                    echo $fila[0];
                    if($fila[0]==$santuario){
                        $centinela=true;
                    }
                }

                if(!$centinela){
                    $insercion=mysqli_query($conexion,"INSERT INTO completados (correo, cod_santuario)
                        VALUES('".$usuario."','".$santuario."')");
                }
            }
            
        }

        /* Insertar atalaya Explorada */
        if($op=="insertar2"){
            $usuario=$_GET['correo'];
            $region=$_GET['numero'];
            $centinela=false;

            if($usuario!="anonimo"){
                $completados=mysqli_query($conexion,"SELECT cod_region FROM registradas WHERE correo='".$usuario."'");
                while($fila=mysqli_fetch_row($completados)){
                    echo $fila[0];
                    if($fila[0]==$region){
                        $centinela=true;
                    }
                }

                if(!$centinela){
                    $insercion=mysqli_query($conexion,"INSERT INTO registradas (correo, cod_region)
                        VALUES('".$usuario."','".$region."')");
                }
            }
            
        }

        /* Atalayas exploradas */
        if($op=="atalayasExploradas"){
            $usuario=$_GET['correo'];
            $zona=$_GET['zona'];

            if($usuario!="anonimo"){
                $resultado=mysqli_query($conexion,"SELECT COD_REGION FROM registradas WHERE CORREO='".$usuario."'");

                while($fila=mysqli_fetch_row($resultado)){
                    $array[$aux]=[$fila[0]];
                    $aux++;
                }
            }
            

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* obtener nombre de las armaduras */
        if($op=="armaduras"){
            $tipo=$_GET['tipo'];

            $resultado=mysqli_query($conexion,"SELECT DISTINCT(conjunto), foto, mejora FROM ropas WHERE tipo='".$tipo."'");

            while($fila=mysqli_fetch_row($resultado)){
                $array[$aux]=[$fila[0],$fila[1],$fila[2]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* partes por armadura */
        if($op=='partesArmadura'){
            $set=$_GET['conjunto'];

            $resultado=mysqli_query($conexion,"SELECT nombre, ubicacion FROM ropas WHERE conjunto='".$set."'");
            while($fila=mysqli_fetch_row($resultado)){
                $array[$aux]=[$fila[0],$fila[1]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* partes de armadura conseguidas */
        if($op=='partesArmaduraConseguidas'){
            $usuario=$_GET['usuario'];

            $resultado=mysqli_query($conexion,"SELECT nombre FROM ropas WHERE cod_ropa in (SELECT cod_ropa from posee WHERE correo='".$usuario."')");
            while($fila=mysqli_fetch_row($resultado)){
                $array[$aux]=[$fila[0]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* partes de la armadura */
        if($op=="partes"){
            $set=$_GET['set'];

            $resultado=mysqli_query($conexion,"SELECT count(*) FROM ropas WHERE conjunto='".$set."'");
            while($fila=mysqli_fetch_row($resultado)){
                $array[$aux]=[$fila[0]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* partes de la armadura Obtenidas */
        if($op=="partesConseguidas"){
            $set=$_GET['set'];
            $usuario=$_GET['usuario'];

            $resultado=mysqli_query($conexion,"select count(*) from posee where correo='".$usuario."' AND COD_ROPA IN ( select COD_ROPA from ropas where conjunto='".$set."')");
            while($fila=mysqli_fetch_row($resultado)){
                $array[$aux]=[$fila[0]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* Guardar las armaduras conseguidas */
        if($op=="guardarArmadura"){
            $usuario=$_GET['correo'];
            $numero=$_GET['numero'];
            $centinela=false;

            if($usuario!="anonimo"){
                $completados=mysqli_query($conexion,"SELECT cod_ropa FROM posee WHERE correo='".$usuario."'");
                while($fila=mysqli_fetch_row($completados)){
                    echo $fila[0];
                    if($fila[0]==$numero){
                        $centinela=true;
                    }
                }

                if(!$centinela){
                    $insercion=mysqli_query($conexion,"INSERT INTO posee (correo, cod_ropa)
                        VALUES('".$usuario."','".$numero."')");
                }
            }
            
        }


        /* Recuperacion CLAVE */
        if($op=="correo"){
            
            //recojo las condiciones de busqueda (alias y contraseña)
            $usuario=$_GET['correo'];

            //variables
            $aux=0;

            //hago la consulta
            $resultado=mysqli_query($conexion,"SELECT correo FROM usuarios WHERE correo='".$usuario."'");
            
            //1 saco la cantidad de filas de la consulta, si es 1 existe
            if(mysqli_num_rows($resultado)==1){
                //generamos una clave aleatoria
                $clave="";
                for($i=0;$i<8;$i++){
                    $rango1=rand(65,90);
                    $char=chr($rango1);
                    $clave.=$char;
                }//for que genera las letras

                while($fila=mysqli_fetch_row($resultado)){
                    $array[$aux]=[$fila[0]];
                }

                /* echo print_r($array); */
                $password=password_hash($clave,PASSWORD_DEFAULT);

                //modifico la tabla
                $resultado=mysqli_query($conexion,"UPDATE usuarios 
                SET CONTRASEÑA='".$password."'
                WHERE correo='".$usuario."'");               

                //envio del correo

                $to=$usuario;
                $titulo=utf8_decode('Recuperación de la contraseña');
                $texto='Hola, he modificado tu clave como me pedistes. Tu clave temporal es <b>'.$clave.'</b>';

                //creo el mensaje con estilos html y css
                
                $mensaje="<html><head><style> .contenedor { background-color: rgb(152, 226, 202); color: black; border: 5px double rgb(255, 217, 107); text-align: center; padding: 1rem 3rem; margin: 3rem auto; border-radius: 0.375rem; box-shadow: 0 1rem 3rem rgba(0, 0, 0, .5); } .titulo { font-weight: bold; } .parrafo { font-size: 1.5rem; margin-bottom: 2rem; text-align: center; } </style></head><body><div class='contenedor'><span class='titulo'>ZELDA TOTK</span><hr><center><p class='parrafo'>".$texto."</p></center></div></body></html>";
                
                $unsalto="\r\n";
                
                $cabeceras = 'From:'.$from.$unsalto;
                $cabeceras .= "MIME-Version: 1.0".$unsalto;
	            $cabeceras .= "Content-Type: text/html;";
	            $cabeceras .= " boundary=Separador_de_partes";

                //envio
                mail($to,$titulo,$mensaje,$cabeceras);

            }
            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }//opcion correo

        /* cambio de contraseña */
        if($op=="cambio"){
            $usuario=$_GET['correo'];
            $keyold=$_GET['keyold'];
            $keynew=$_GET['keynew'];

            $array=0;

            $cambio=mysqli_query($conexion,"SELECT contraseña FROM usuarios WHERE correo='".$usuario."'");

            while($fila=mysqli_fetch_row($cambio)){
                if(password_verify($keyold,$fila[0])){
                    //echo "Entra";
                    $key=password_hash($keynew,PASSWORD_DEFAULT);
                    $modificacion=mysqli_query($conexion,"UPDATE usuarios SET contraseña='".$key."' WHERE correo='".$usuario."'");
                    $array=1; 
                }else{
                    //echo "no entra";
                }
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* obtener poderes */
        if($op=="poder"){
            $consulta=mysqli_query($conexion,"SELECT * FROM poderes");

            while($fila=mysqli_fetch_row($consulta)){
                $array[$aux]=[$fila[0],$fila[1],$fila[2],$fila[3]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* Obtencion de todos los santuarios */
        if($op=="santuarioGeneral"){
            $consulta=mysqli_query($conexion,"SELECT nombre, cod_region FROM santuarios");

            while($fila=mysqli_fetch_row($consulta)){
                $array[$aux]=[$fila[0],$fila[1]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }

        /* Obtencion de todas las armaduras */
        if($op=="armadurasGeneral"){
            $consulta=mysqli_query($conexion,"SELECT nombre, tipo, conjunto FROM ropas");

            while($fila=mysqli_fetch_row($consulta)){
                $array[$aux]=[$fila[0],$fila[1],$fila[2]];
                $aux++;
            }

            //indico que sera un JSON con UTF-8
            header("Content-type: application/json; charset=utf-8");
            //muestro por pantalla
            echo json_encode($array);
        }
    }
?>