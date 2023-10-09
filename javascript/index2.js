let root = "http://localhost/Zelda";

/* Funcion para entrar en el perfil */
async function entrar(opcion, correo, key) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion)+"&correo="+ encodeURIComponent(correo)+ "&key=" +encodeURIComponent(key));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&key=" + encodeURIComponent(key), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();
    if (response[0] != "error") {
        sessionStorage.setItem('usuario', response[0][0]);
        return 1;
    } else {
        return 0;
    }
}

/* Registro de usuario */
async function registro(opcion, correo, key) {
    console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&key=" + encodeURIComponent(key));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&key=" + encodeURIComponent(key), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();
    if (response == 1) {
        sessionStorage.setItem('usuario', correo);
        return 1;
    } else {
        return 0;
    }
}

async function olvido(opcion, correo) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });
}

async function cambio(opcion, usuario, keyold, keynew){
    console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(usuario) + "&keyold=" + encodeURIComponent(keyold)+ "&keynew="+ encodeURIComponent(keynew));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(usuario) + "&keyold=" + encodeURIComponent(keyold)+ "&keynew="+ encodeURIComponent(keynew), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();
    if (response == 1) {
        sessionStorage.setItem('usuario', usuario);
        return 1;
    } else {
        return 0;
    }
}

window.addEventListener("load", () => {
    let usuario = document.getElementById("usuario");
    let contraseña = document.getElementById("contraseña");

    /* Botones iniciales */
    let btnEntrar = document.getElementById("entrar");
    let btnRegistro = document.getElementById("registro");
    let btnAnonimo = document.getElementById("anonimus");
    let btnRecuperar = document.getElementById("olvido");

    /* validacion */
    let validacion = document.getElementById("validacion");

    /* modal */
    let usuario1 = document.getElementById("usuario1");
    let keyold = document.getElementById("keyold");
    let keynew = document.getElementById("keynew");
    let btnModal = document.getElementById("cambiarKey");

    validacion.style.display = "none";

    btnEntrar.addEventListener("click", async () => {

        let validacion1 = true;
        if (usuario.value == "") {
            usuario.style.border = "2px solid red";
            validacion1 = false;
        } else {
            usuario.style.border = "1px solid black";
        }

        if (contraseña.value == "") {
            contraseña.style.border = "2px solid red";
            validacion1 = false;
        } else {
            contraseña.style.border = "1px solid black";
        }

        if (validacion1) {
            let resultado = await entrar("entrar", usuario.value, contraseña.value);
            if (resultado == 0) {
                usuario.style.border = "2px solid red";
                contraseña.style.border = "2px solid red";
                validacion.style.color = "red";
                validacion.style.fontWeight = "bold";
                validacion.style.display = "block";
                validacion.innerHTML = "Usuario o contraseña incorrecta";
            } else {
                validacion.style.display = "none";
            }
        }
    });

    btnRegistro.addEventListener("click", async () => {
        let validacion1 = true;
        if (usuario.value == "") {
            usuario.style.border = "2px solid red";
            validacion1 = false;
        } else {
            usuario.style.border = "1px solid black";
        }

        if (contraseña.value == "") {
            contraseña.style.border = "2px solid red";
            validacion1 = false;
        } else {
            contraseña.style.border = "1px solid black";
        }

        if (validacion1) {
            let resultado = await registro("registro", usuario.value, contraseña.value);
            if (resultado == 0) {
                usuario.style.border = "2px solid red";
                contraseña.style.border = "2px solid red";
                validacion.style.color = "red";
                validacion.style.fontWeight = "bold";
                validacion.style.display = "block";
                validacion.innerHTML = "Ese usuario ya esta registrado";
            } else {
                validacion.style.display = "none";
            }
        }
    });

    btnAnonimo.addEventListener("click", () => {
        usuario.value = "anonimo";
        contraseña.value = "1234";
        sessionStorage.setItem('usuario', usuario.value);
    });

    btnRecuperar.addEventListener("click", async () => {
        let validacion1 = true;
        if (usuario.value == "") {
            usuario.style.border = "2px solid red";
            validacion1 = false;
        } else {
            usuario.style.border = "1px solid black";
        }

        if (validacion1) {
            await olvido("correo", usuario.value);
            btnModal.addEventListener("click", async () => {
                let validacionModal = true;
                if (usuario1.value == "") {
                    validacionModal = false;
                    usuario1.style.border = "2px solid red";
                } else {
                    usuario1.style.border = "1px solid black";
                }

                if (keyold.value == "") {
                    validacionModal = false;
                    keyold.style.border = "2px solid red";
                } else {
                    keyold.style.border = "1px solid black";
                }

                if (keynew.value == "") {
                    validacionModal = false;
                    keynew.style.border = "2px solid red";
                } else {
                    keynew.style.border = "1px solid black";
                }

                /* llamada al php para cambiar la contraseña */
                if(validacionModal){
                    let resultado= await cambio("cambio",usuario1.value,keyold.value,keynew.value);

                    if(resultado==0){
                        keyold.style.border = "2px solid red";
                        usuario1.style.border = "2px solid red";
                    }
                }
            })
        }
    })


})