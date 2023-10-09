
let santuarios = [];//array con todos los santuarios
let armaduras = [];//array con todos los nombres de las armaduras

/* obtencion de los santuarios */
async function santuario(opcion) {
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    if (response.length > 0) {
        for (let i = 0; i < response.length; i++) {
            santuarios[i] = [response[i][0], response[i][1]]; //nombre, zona
        }
    }
}

/* obtencion de las armaduras */
async function ropas(opcion) {
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    if (response.length > 0) {
        for (let i = 0; i < response.length; i++) {
            armaduras[i] = [response[i][0], response[i][1], response[i][2]];//nombre, tipo, conjunto
        }
    }
}

window.addEventListener("load", async () => {
    let buscador = document.getElementById("buscador");
    let abuscar = document.getElementById("busqueda");

    await santuario("santuarioGeneral");
    await ropas("armadurasGeneral");

    buscador.addEventListener("click", () => {
        let pos = -1;
        let array = "";
        if (abuscar.value != "") {
            /* recorro el array santuarios */
            for (let s = 0; s < santuarios.length; s++) {
                if (santuarios[s][0] == abuscar.value) {
                    pos = s;
                    array = "santuarios";
                    sessionStorage.setItem("array", "santuarios");
                    sessionStorage.setItem("posicion", santuarios[s][1]);
                    break;
                }
            }//for

            /* busco en armaduras */
            for (let r = 0; r < armaduras.length; r++) {
                if (armaduras[r][0] == abuscar.value) {
                    pos = r;
                    array = "armaduras";
                    sessionStorage.setItem("array", "armaduras");
                    sessionStorage.setItem("posicion", pos);
                    sessionStorage.setItem("tipo", armaduras[r][1]);
                    sessionStorage.setItem("conjunto", armaduras[r][2]);
                    break;
                }
            }//for

            //buscar por frio
            if (pos == -1 && (abuscar.value == "frio" || abuscar.value == "Frio")) {
                sessionStorage.setItem("array", "frio");
                array = "frio";
                pos=0;
            }

            if (pos == -1 && (abuscar.value == "calor" || abuscar.value == "Calor")) {
                sessionStorage.setItem("array", "calor");
                array = "calor";
                pos=0;
            }

            if (pos == -1 && (abuscar.value == "especial" || abuscar.value == "Especial")) {
                sessionStorage.setItem("array", "especial");
                array = "especial";
                pos=0;
            }

            if (pos == -1 && (abuscar.value == "normal" || abuscar.value == "Normal")) {
                sessionStorage.setItem("array", "normal");
                array = "normal";
                pos=0;
            }

            if(pos==-1){
                sessionStorage.setItem("array", "error");
                array = "error";
            }

            console.log(abuscar.value + " esta en " + array + " posicion " + pos);

            switch (array) {
                case "santuarios":
                    //window.location.replace('http://localhost/ZELDA/zonas2.html');
                    //window.location.href = 'http://localhost/Zelda/zonas2.html';
                    window.open("http://localhost/Zelda/zonas2.html");
                    break;
                case "armaduras":
                    //window.location.replace('http://localhost/ZELDA/ropas2.html');
                    window.open("http://localhost/Zelda/ropas2.html");
                    break;
                case "normal":
                    //window.location.replace('http://localhost/ZELDA/ropas2.html');
                    window.open("http://localhost/Zelda/ropas2.html");
                    break;
                case "especial":
                    //window.location.replace('http://localhost/ZELDA/ropas2.html');
                    window.open("http://localhost/Zelda/ropas2.html");
                    break;
                case "frio":
                    //window.location.replace('http://localhost/ZELDA/ropas2.html');
                    window.open("http://localhost/Zelda/ropas2.html");
                    break;
                case "calor":
                    //window.location.replace('http://localhost/ZELDA/ropas2.html');
                    window.open("http://localhost/Zelda/ropas2.html");
                    break;
                default:
                    //window.location.replace('http://localhost/ZELDA/index2.html');
                    window.open("http://localhost/Zelda/index2.html");
                    break;
            }
            console.log(window.location.href);
        }//if si tiene algo para buscar o no

    })
})