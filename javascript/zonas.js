let regiones = [];
let santuarios = [];
let atalayas = [];
let completados = [];

let santuariosTerminados = 0;

let root = "http://localhost/Zelda";
let auxiliar = 0;//para el id delos checkbox
let totalAtalayas = 0;//total atalayas

/* Devuelve las zonas de hyrule */
async function region(opcion) {

    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    if (response.length > 0) {
        for (let i = 0; i < response.length; i++) {
            regiones[i] = [response[i][0], response[i][1], response[i][2], response[i][3], response[i][4]];
        }
    }
}

/* Santuarios Realizados NUMERO*/
async function hechos(opcion, correo, zona) {

    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&zona=" + encodeURIComponent(zona));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&zona=" + encodeURIComponent(zona), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();
    let resultado;
    if (isNaN(response[0])) {
        resultado = 0
    } else {
        resultado = response[0];
    }
    return resultado;
}

/* Atalayas registradas */
async function atalayaOK(opcion, correo) {

    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();
    for (let c = 0; c < response.length; c++) {
        atalayas.push(response[c]);
    }//meto las atalayas registradas del usuario
}

/* Santuarios por zona */
async function santuariosZona(opcion, zona) {
    zona++;
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&zona=" + encodeURIComponent(zona));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&zona=" + encodeURIComponent(zona), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();
    santuarios = [];

    for (let i = 0; i < response.length; i++) {
        santuarios.push(response[i]);
    }//meto los santuarios dentro del array de santuarios
}

/* Santuarios completados */
async function santuariosOKZona(opcion, correo, zona) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&zona=" + encodeURIComponent(zona))
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&zona=" + encodeURIComponent(zona), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();
    for (let c = 0; c < response.length; c++) {
        completados.push(response[c]);
    }//meto los completados del usuario
}

/* Guardar santuarios completados */
async function guardar(opcion, correo, numero) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&numero=" + encodeURIComponent(numero));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&numero=" + encodeURIComponent(numero), {
        method: "POST",
        headers: { "Content-type": "application/json" }
    });
}

/* Guardar Atalayas */
async function guardar2(opcion, correo, numero) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&numero=" + encodeURIComponent(numero));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&correo=" + encodeURIComponent(correo) + "&numero=" + encodeURIComponent(numero), {
        method: "POST",
        headers: { "Content-type": "application/json" }
    });
}

window.addEventListener("load", async () => {
    let cuerpo = document.getElementById("cuerpo");
    let actualizar = document.getElementById("actualizar");

    let usuario = sessionStorage.getItem("usuario");

    let rowPadre = document.createElement("div");

    if (usuario == "") {
        window.location.replace(root + "/index2.html");
    }

    rowPadre.classList.add("row", "justify-content-center", "align-content-center");

    await region("regiones");
    await atalayaOK("atalayasExploradas", usuario);
    for (let i = 0; i < regiones.length; i++) {
        hijo = document.createElement("div");//div col-4
        hijo.classList.add("col-4");
        hijo.id = "Region" + i;

        /* inicio del acordeon */
        let acordeon = document.createElement("div");
        acordeon.classList.add("accordion", "d-flex", "justify-content-center");

        /* Tarjeta */
        let tarjeta = document.createElement("div");
        tarjeta.classList.add("card", "w-100", "m-3", "bg-dark", "bg-opacity-75", "text-light");
        tarjeta.i = "acordeon" + i;

        /* div boton */
        let divBoton = document.createElement("div");
        divBoton.classList.add("card-header", "text-center");
        divBoton.id = "boton-collapse-" + i;

        /* Boton */
        let boton = document.createElement("button");
        boton.classList.add("btn", "text-center");
        boton.setAttribute("data-bs-toggle", "collapse");
        boton.setAttribute("data-bs-target", "#contenido-btn-" + i);
        /* if(sessionStorage.getItem("array")=="santuarios"){
            if(sessionStorage.getItem("posicion")==i+1){
                boton.setAttribute("aria-expanded", "true");
            }else{
                boton.setAttribute("aria-expanded", "false");
            }
        } */
        boton.setAttribute("aria-expanded", "false");
        boton.setAttribute("aria-controls", "contenido-btn-" + i);

        /* Titulo boton */
        let titulo = document.createElement("h6");
        titulo.classList.add("text-light", "ps-2", "pe-2", "mt-2", "mb-2");
        titulo.innerHTML = regiones[i][1];

        /* agrego el titulo al boton */

        boton.appendChild(titulo);

        /* agrego el boton a su div de la tarjeta */
        divBoton.appendChild(boton);

        /* CONTENIDO */
        let divContenido = document.createElement("div");
        /* if(sessionStorage.getItem("array")=="santuarios"){
            if(sessionStorage.getItem("posicion")==i+1){
                divContenido.classList.add("collapse","show");
            }else{
                divContenido.classList.add("collapse");
            }
        } */
        divContenido.classList.add("collapse");
        divContenido.id = "contenido-btn-" + i;
        divContenido.setAttribute("aria-labelledby", "boton-collapse-" + i);
        divContenido.setAttribute("data-bs-parent", "#acordeon00" + i);

        /* cuerpo tarjeta */
        let cuerpo = document.createElement("div");
        cuerpo.classList.add("card-body", "text-center");

        /* Imagen mapa */
        let img = document.createElement("img");
        img.setAttribute("src", regiones[i][2]);
        img.alt = regiones[i][1];
        img.classList.add("card-img-top");

        /* subtitulo tarjeta */
        let h5 = document.createElement("h5");
        h5.classList.add("card-text", "text-center", "my-2");
        h5.innerHTML = regiones[i][1];

        /* Descripcion en tarjeta */
        let p = document.createElement("p");
        p.classList.add("card-text");
        p.innerHTML = regiones[i][4];

        let atalaya = document.createElement("h4");
        atalaya.classList.add("text-center", "my-2");

        if (i + 1 > 1 && i + 1 < 17) {
            for (let a = 0; a < atalayas.length; a++) {
                if (i + 1 == atalayas[a]) {
                    atalaya.innerHTML = "<h4>Atalaya &nbsp<input type='checkbox' class='form-check-input atalaya2' id='atalaya" + atalayas[a] + "' checked></h4>";
                    totalAtalayas++;
                    break;
                } else {
                    atalaya.innerHTML = "<h4>Atalaya &nbsp<input type='checkbox' class='form-check-input atalaya2' id='atalaya" + (i + 1) + "'></h4>";
                }
            }
        }



        //////////////////////////////////////////////////////////////////////
        /* TARJETA SANTUARIOS */
        let tarjetaSantuarios = document.createElement("div");
        tarjetaSantuarios.classList.add("card-header", "text-center", "m-0", "p-0");
        tarjetaSantuarios.id = "santuarios-" + i;

        /* Boton Tarjeta Santuario */
        let botonSantuario = document.createElement("button");
        botonSantuario.classList.add("btn", "btn-block", "text-center", "santuarios");
        botonSantuario.setAttribute("data-bs-toggle", "collapse");
        botonSantuario.setAttribute("data-bs-target", "#santuarios-btn-" + i);
        /* if(sessionStorage.getItem("array")=="santuarios"){
            if(sessionStorage.getItem("posicion")==i+1){
                botonSantuario.setAttribute("aria-expanded", "true");
            }else{
                botonSantuario.setAttribute("aria-expanded", "false");
            }
        } */
        botonSantuario.setAttribute("aria-expanded", "false");
        botonSantuario.setAttribute("aria-controls", "santuarios-btn-" + i);

        /* titulo santuarios */
        let h4Santuario = document.createElement("h4");
        h4Santuario.classList.add("text-light");
        h4Santuario.innerHTML = "Santuarios";

        /* Conteo de Santuarios de la region */
        let spanTotal = document.createElement("span");
        spanTotal.classList.add("badge", "bg-primary", "rounded-pill");
        spanTotal.innerHTML = regiones[i][3];

        /* Conteo de Santuarios de la region HECHOS*/
        let spanCompletados = document.createElement("span");
        spanCompletados.classList.add("badge", "bg-success", "rounded-pill");
        //realizo la consulta
        //aqui funcionaria mediante sesiones (js o php) lo pongo de forma temporal en la mia
        spanCompletados.innerHTML = await hechos("realizados", usuario, i + 1);
        santuariosTerminados += parseInt(await hechos("realizados", usuario, i + 1));

        h4Santuario.appendChild(spanTotal);
        h4Santuario.appendChild(spanCompletados);

        /* Contenido tarjeta */
        let divContSantuario = document.createElement("div");
        /* if(sessionStorage.getItem("array")=="santuarios"){
            if(sessionStorage.getItem("posicion")==i+1){
                divContSantuario.classList.add("collapse","show");
            }else{
                divContSantuario.classList.add("collapse");
            }
        } */
        divContSantuario.classList.add("collapse");
        divContSantuario.id = "santuarios-btn-" + i;
        divContSantuario.setAttribute("aria-labelledby", "santuarios-" + i);
        divContSantuario.setAttribute("data-bs-parent", "#acordeon00" + i);

        /* Contenido de la tarjeta santuario */
        let contenidoSantuario = document.createElement("div");
        contenidoSantuario.classList.add("card-body");

        let lista = document.createElement("ul");

        //saco los santuarios de esta zona
        await santuariosZona("santuariosZona", i);
        await santuariosOKZona("completados", usuario, i + 1);


        let centinela = false;
        let cadena = "";
        for (let s = 0; s < santuarios.length; s++) {
            for (let p = 0; p < completados.length; p++) {
                if (completados[p] == santuarios[s][0]) {
                    cadena += "<li class='list-unstyled '><a href='" + santuarios[s][1] + "' target='_blank' class='text-decoration-none text-success'>" + santuarios[s][0] + "</a> &nbsp<input type='checkbox' class='form-check-input santu' id='santuario" + auxiliar + "' checked></li>";
                    centinela = true;
                }
            }
            if (!centinela) {
                cadena += "<li class='list-unstyled '><a href='" + santuarios[s][1] + "' target='_blank' class='text-decoration-none text-secondary'>" + santuarios[s][0] + "</a> &nbsp<input type='checkbox' class='form-check-input santu' id='santuario" + auxiliar + "'></li>";
            }
            auxiliar++;
            centinela = false;
        }//creo la lista donde estaran todos los santuarios
        lista.innerHTML = cadena;

        botonSantuario.appendChild(h4Santuario);
        divContSantuario.appendChild(contenidoSantuario);
        contenidoSantuario.appendChild(lista);

        tarjetaSantuarios.appendChild(botonSantuario);
        tarjetaSantuarios.appendChild(divContSantuario);

        ///////////////////////////////////////////////////////////////////////
        /* Agregaciones al div */
        cuerpo.appendChild(img);
        cuerpo.appendChild(h5);
        cuerpo.appendChild(p);
        cuerpo.appendChild(atalaya);
        cuerpo.appendChild(tarjetaSantuarios);

        divContenido.appendChild(cuerpo);
        ///////////////////////////////////////////////////////////////////////
        tarjeta.appendChild(divBoton);
        tarjeta.appendChild(divContenido)
        acordeon.appendChild(tarjeta);
        hijo.appendChild(acordeon);


        rowPadre.appendChild(hijo);

        if (sessionStorage.getItem("array") == "santuarios") {
            if (sessionStorage.getItem("posicion") == i + 1) {
                boton.setAttribute("aria-expanded", "true");
                divContenido.classList.add("show");
                botonSantuario.setAttribute("aria-expanded", "true");
                divContSantuario.classList.add("show");
            }
        }
    }//for

    cuerpo.appendChild(rowPadre);

    let terminados = document.getElementById("santuariosTerminados");
    terminados.innerHTML = santuariosTerminados;

    let atalayasOk = document.getElementById("atalayasTerminados");
    atalayasOk.innerHTML = totalAtalayas;

    sessionStorage.setItem("conjunto", "");
    sessionStorage.setItem("array", "");
    sessionStorage.setItem("posicion", "-1");
    sessionStorage.setItem("tipo", "");

    actualizar.addEventListener("click", async () => {
        let ristraSantuarios = document.getElementsByClassName("santu");
        let ristraAtalayas = document.getElementsByClassName("atalaya2");

        for (let i = 0; i < ristraSantuarios.length; i++) {
            /* Compruebo si estan marcados */
            if (ristraSantuarios[i].checked) {
                await guardar("insertar", usuario, i + 1);
            }
        }

        for (i = 0; i < ristraAtalayas.length; i++) {
            /* Compruebo si estan marcados */
            if (ristraAtalayas[i].checked) {
                await guardar2("insertar2", usuario, i + 2);
            }
        }
        location.reload();
    })
});