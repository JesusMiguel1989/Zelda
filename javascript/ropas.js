let armadurasNormales = [];
let armadurasEspeciales = [];
let armadurasCalor = [];
let armadurasFrio = [];
let conjunto = [];

let obtenidas = [];
let posicion=0;

/* evento click */
let click=new Event("click");

let root = "http://localhost/Zelda";

let auxiliar = 0;//para el id delos checkbox

/* Obtener armaduras Normales*/
async function armaduraNormal(opcion, tipo) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion)+"&tipo=" + encodeURIComponent(tipo));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&tipo=" + encodeURIComponent(tipo), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    for (let i = 0; i < response.length; i++) {
        armadurasNormales[i] = response[i];
    }
}

/* Obtener armaduras Especiales*/
async function armaduraEspecial(opcion, tipo) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion)+"&tipo=" + encodeURIComponent(tipo));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&tipo=" + encodeURIComponent(tipo), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    for (let i = 0; i < response.length; i++) {
        armadurasEspeciales[i] = response[i];
    }
}

/* Obtener armaduras Frio*/
async function armaduraFrio(opcion, tipo) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion)+"&tipo=" + encodeURIComponent(tipo));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&tipo=" + encodeURIComponent(tipo), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    for (let i = 0; i < response.length; i++) {
        armadurasFrio[i] = response[i];
    }
}

/* Obtener armaduras Calor*/
async function armaduraCalor(opcion, tipo) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion)+"&tipo=" + encodeURIComponent(tipo));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&tipo=" + encodeURIComponent(tipo), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    for (let i = 0; i < response.length; i++) {
        armadurasCalor[i] = response[i];
    }
}

/* armaduras por conjunto */
async function armaduraPartes(opcion, set) {
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&conjunto=" + encodeURIComponent(set), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    conjunto = [];
    for (let i = 0; i < response.length; i++) {
        conjunto[i] = response[i];
    }
}

async function armadurasObtenidas(opcion, usuario) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion)+ "&usuario="+ encodeURIComponent(usuario));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&usuario=" + encodeURIComponent(usuario), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    for (let i = 0; i < response.length; i++) {
        obtenidas[i] = response[i];
    }
}

/* Obtener Nº de partes del set NUM*/
async function cantidad(opcion, set) {
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&set=" + encodeURIComponent(set), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    let resultado = 0;
    if (response.length > 0) {
        resultado = response[0];
    }
    return resultado;
}

/* armaduras Conseguidas NUM*/
async function cantidadConseguido(opcion, set, usuario) {
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&set=" + encodeURIComponent(set) + "&usuario=" + encodeURIComponent(usuario), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    return response;
}

/* Funcion global para la creaccion */
async function creacion(array, letra) {
    let divrow = document.createElement("div");//division inicial;
    divrow.classList.add("row");//indico clase
    for (let i = 0; i < array.length; i++) {
        /* NORMALES */
        let divcol = document.createElement("col");//division por columna
        divcol.classList.add("col-4", "border-secondary");//indico clase


        let divAcordeon = document.createElement("div");//creo el acordeon
        divAcordeon.classList.add("accordion", "justify-content-center", "m-2", "border", "border-white", "border-2");//indico las clases

        let divCard = document.createElement("div");
        divCard.classList.add("card", "w-100", "m-5", "bg-dark", "bg-opacity-75", "text-light");
        divCard.id = "acordeonAN" + i;

        /* Boton */
        let divboton = document.createElement("div");
        divboton.classList.add("card-header", "text-center");
        divboton.id = "boton-collapse-" + letra + i;

        let btn = document.createElement("button");
        btn.classList.add("btn", "text-center");
        btn.setAttribute("data-bs-toggle", "collapse");
        btn.setAttribute("data-bs-target", "#contenido-btn-" + letra + i);
        btn.setAttribute("aria-expanded", "false");
        btn.setAttribute("aria-controls", "contenido-btn-" + letra + i);

        let h4Nombre = document.createElement("h4");
        h4Nombre.classList.add("text-light", "ps-2", "pe-2", "mt-2", "mb-2");
        h4Nombre.innerHTML = array[i][0];

        btn.appendChild(h4Nombre);//añado el h4 al boton

        /* CONTENIDO */
        let divContenido = document.createElement("div");
        divContenido.classList.add("collapse");
        divContenido.id = "contenido-btn-" + letra + i;
        divContenido.setAttribute("aria-labelledby", "boton-collapse-" + letra + i);
        divContenido.setAttribute("data-bs-parent", "#acordeon00-" + letra + i);

        let divCardBody = document.createElement("div");
        divCardBody.classList.add("card-body", "text-center");

        let img = document.createElement("img");//imagen de la armadura
        img.setAttribute("src", array[i][1]);
        img.setAttribute("alt", array[i][0]);
        img.classList.add("card-img-top", "armaduras");

        let h5Armadura = document.createElement("h5");
        h5Armadura.classList.add("card-text", "text-center", "my-2");
        h5Armadura.innerHTML = array[i][0];

        let pArmadura = document.createElement("p");
        pArmadura.classList.add("card-text", "text-light");
        pArmadura.innerHTML = "<u><b>Mejora</b></u><br>" + array[i][2];

        divCardBody.appendChild(img);
        divCardBody.appendChild(h5Armadura);
        divCardBody.appendChild(pArmadura);

        /* Sub acordeon con las partes de la armadura */
        let divPartes = document.createElement("div");
        divPartes.classList.add("card-header", "text-center", "m-0", "p-0");
        divPartes.id = "armadura-" + letra + i;

        let partesbtn = document.createElement("button");
        partesbtn.classList.add("btn", "btn-block", "text-center", "armadura");
        partesbtn.setAttribute("data-bs-toggle", "collapse");
        partesbtn.setAttribute("data-bs-target", "#armadura-btn-" + letra + i);
        partesbtn.setAttribute("aria-expanded", "false");
        partesbtn.setAttribute("aria-controls", "armadura-btn-" + letra + i);

        let h4Partes = document.createElement("h4");
        h4Partes.classList.add("text-light");
        let resultado1 = await cantidad("partes", array[i][0]);
        let resultado2 = await cantidadConseguido("partesConseguidas", array[i][0], sessionStorage.getItem("usuario"));
        h4Partes.innerHTML = "Partes <span class='badge bg-primary rounded-pill'>" + resultado1 + "</span> <span class='badge bg-success rounded-pill'>" + resultado2 + "</span>";

        /* contenido partes */
        let divPartesContenido = document.createElement("div");
        divPartesContenido.classList.add("collapse");
        divPartesContenido.id = "armadura-btn-" + letra + i;
        divPartesContenido.setAttribute("aria-labelledby", "armadura-" + letra + i);
        divPartesContenido.setAttribute("data-bs-parent", "#armaduras0" + letra + i);

        let divCardPartes = document.createElement("div");
        divCardPartes.classList.add("card-body");

        let lista = document.createElement("ul");
        await armaduraPartes("partesArmadura", array[i][0]);
        let cadena = "";
        let centinela = false;
        for (a = 0; a < conjunto.length; a++) {
            for (let p = 0; p < obtenidas.length; p++) {
                if (obtenidas[p] == conjunto[a][0]) {
                    cadena += "<li class='list-unstyled text-success'>" + conjunto[a][0] + "&nbsp<input type='checkbox' class='form-check-input ropajesInput' id='armadura" + letra + auxiliar + "' checked></li>";
                    centinela = true;
                }
            }
            if (!centinela) {
                cadena += "<li class='list-unstyled text-light'> " + conjunto[a][0] + "&nbsp<input type='checkbox' class='form-check-input ropajesInput' id='armadura" + letra + auxiliar + "'></li>";
            }
            auxiliar++;
            centinela = false;
        }
        lista.innerHTML = cadena;
        divCardPartes.appendChild(lista);

        divPartesContenido.appendChild(divCardPartes);

        partesbtn.appendChild(h4Partes);
        divPartes.appendChild(partesbtn);
        divPartes.appendChild(divPartesContenido);

        if(sessionStorage.getItem("conjunto")==array[i][0]){
            btn.setAttribute("aria-expanded", "true");
            divContenido.classList.add("show");
            partesbtn.setAttribute("aria-expanded", "true");
            divPartesContenido.classList.add("show");
        }

        /* donde estan? */
        let divDonde = document.createElement("div");
        divDonde.classList.add("card-header", "text-center", "m-0", "p-0");
        divDonde.id = "armaduraD-" + letra + i;

        /* boton donde */
        let btnDonde = document.createElement("button");
        btnDonde.classList.add("btn", "btn-block", "text-center", "armadura");
        btnDonde.setAttribute("data-bs-toggle", "collapse");
        btnDonde.setAttribute("data-bs-target", "#armadura-btn-D-" + letra + i);
        btnDonde.setAttribute("aria-expanded", "false");
        btnDonde.setAttribute("aria-controls", "armadura-btn-D" + letra + i);
        btnDonde.innerHTML = "<h4 class='text-light'>¿Donde esta?</h4>";

        /* Contenido Donde */
        let divDondeContenido = document.createElement("div");
        divDondeContenido.classList.add("collapse");
        divDondeContenido.id = "armadura-btn-D-" + letra + i;
        divDondeContenido.setAttribute("aria-labelledby", "armaduraD-" + letra + i);
        divDondeContenido.setAttribute("data-bs-parent", "#acordeon" + letra + i);

        /* card donde */
        let cardDonde = document.createElement("div");
        cardDonde.classList.add("card-body");

        /* saco la informacion */
        let pDonde = document.createElement("p");
        pDonde.classList.add("text-light");
        let cadDonde = "";
        for (a = 0; a < conjunto.length; a++) {
            cadDonde += "<b><u>" + conjunto[a][0] + "</u></b><br>" + conjunto[a][1] + "<br><br>";
        }
        pDonde.innerHTML = cadDonde;

        cardDonde.appendChild(pDonde);

        divDondeContenido.appendChild(cardDonde);

        divDonde.appendChild(btnDonde);
        divDonde.appendChild(divDondeContenido);
        //////////////////////117

        /* agregacion */
        divCardBody.appendChild(divPartes);
        divCardBody.appendChild(divDonde);

        divContenido.appendChild(divCardBody);
        divboton.appendChild(btn);

        divAcordeon.appendChild(divboton);
        divAcordeon.appendChild(divContenido);

        divcol.appendChild(divAcordeon);
        divrow.appendChild(divcol);

    }
    return divrow;
}

/* Agregar las armauras conseguidas */
async function guardarArmadura(opcion, numero, correo) {
    //console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion)+"&numero=" + encodeURIComponent(numero)+"&correo=" + encodeURIComponent(correo));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion) + "&numero=" + encodeURIComponent(numero) + "&correo=" + encodeURIComponent(correo), {
        method: "post",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();
}

window.addEventListener("load", async () => {
    let normales = document.getElementById("armadurasNormales");
    let especiales = document.getElementById("armadurasEspeciales");
    let calor = document.getElementById("armadurasCalor");
    let frio = document.getElementById("armadurasFrio");

    /* etiquetas a */
    let nor = document.getElementById("normales-tab");
    let esp = document.getElementById("especiales-tab");
    let fri = document.getElementById("frio-tab");
    let cal = document.getElementById("calor-tab");

    //btn
    let actualizar = document.getElementById("actualizar");

    await armaduraNormal("armaduras", "Normal");
    await armaduraEspecial("armaduras", "Especial");
    await armaduraFrio("armaduras", "Frio");
    await armaduraCalor("armaduras", "Calor");
    await armadurasObtenidas("partesArmaduraConseguidas", sessionStorage.getItem("usuario"));

    let normal = await creacion(armadurasNormales, "N");
    normales.appendChild(normal);

    let especial = await creacion(armadurasEspeciales, "E");
    especiales.appendChild(especial);

    let frioo = await creacion(armadurasFrio, "F");
    frio.appendChild(frioo);

    let calo = await creacion(armadurasCalor, "C");
    calor.appendChild(calo);

    actualizar.addEventListener("click", async () => {
        let input = document.getElementsByClassName("ropajesInput");

        for (let r = 0; r < input.length; r++) {
            if (input[r].checked) {
                //console.log(r);
                await guardarArmadura("guardarArmadura", r +1 , sessionStorage.getItem("usuario"));
            }
        }
        location.reload();
    })

    let id="";
    let temp;
    if (sessionStorage.getItem("array") == "armaduras") {
        switch (sessionStorage.getItem("tipo")) {
            case "Normal":
                nor.dispatchEvent(click);
                break;
            case "Especial":
                esp.dispatchEvent(click);
                break;
            case "Frio":
                fri.dispatchEvent(click);
                break;
            case "Calor":
                cal.dispatchEvent(click);
                break;
        }
        sessionStorage.setItem("conjunto","");
        sessionStorage.setItem("array","");
        sessionStorage.setItem("posicion","-1");
        sessionStorage.setItem("tipo","");
    }

    if(sessionStorage.getItem("array")!=""){
        switch (sessionStorage.getItem("array")) {
            case "normal":
                nor.dispatchEvent(click);
                break;
            case "especial":
                esp.dispatchEvent(click);
                break;
            case "frio":
                fri.dispatchEvent(click);
                break;
            case "calor":
                cal.dispatchEvent(click);
                break;
        }
        sessionStorage.setItem("conjunto","");
        sessionStorage.setItem("array","");
        sessionStorage.setItem("posicion","-1");
        sessionStorage.setItem("tipo","");
    }
});