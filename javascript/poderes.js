

let habilidades = [];


let root = "http://localhost/Zelda";

/* obtener datos de los poderes */
async function poderes(opcion){
    console.log(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion));
    let response = await fetch(root + "/php/zelda.php?opcion=" + encodeURIComponent(opcion), {
        method: "GET",
        headers: { "Content-type": "application/json" }
    });

    response = await response.json();

    for(let i=0;i<response.length;i++){
        habilidades[i]=response[i];
    }
}

window.addEventListener("load",async ()=>{
    let poder = document.getElementById("poderes");

    await poderes("poder");

    let divContainer=document.createElement("div");//div general
    divContainer.classList.add("container","mt-5");

    let divRow=document.createElement("div");//div fila
    divRow.classList.add("row");

    for(let i=0;i<habilidades.length;i++){
        let divCol=document.createElement("div");//div columna para poder
        divCol.classList.add("col-12", "col-md-6", "col-xl-4","mb-3");

        let divCard=document.createElement("div");//div card
        divCard.classList.add("card", "h-100", "bg-opacity-75", "w-100", "border", "border-light", "border-2", "bg-dark", "bg-opacity-75", "text-light", "mt-5");

        let divCardBody=document.createElement("div");//div card body
        divCardBody.classList.add("card-body");

        let body1=document.createElement("div");//1 parte de la tarjeta
        body1.classList.add("ms-3", "mb-3", "ps-3");

        let row2=document.createElement("div");//div fila para dividir el cuerpo de la tarjeta
        row2.classList.add("row");

        let col2=document.createElement("div");//div col 4 para la imagen
        col2.classList.add("col-3");

        let img=document.createElement("img");//img del logo
        img.classList.add("border", "border-secondary", "border-3", "rounded-circle", "logo2");
        img.setAttribute("src",habilidades[i][2]);
        img.setAttribute("alt",habilidades[i][0]);

        let col3=document.createElement("div");//2 columna de la tarjeta
        col3.classList.add("col-9", "text-start");

        let h3=document.createElement("h4");//itulo de la tarjeta
        h3.classList.add("ms-5", "pt-3");
        h3.innerText=habilidades[i][0];

        let divHabilidad=document.createElement("div");//div para habilidad
        let h3Habilidad=document.createElement("h3");//titulo habilidad
        h3Habilidad.classList.add("text-center");
        h3Habilidad.innerText="Habilidad";

        let pHabilidad=document.createElement("p");//indico que hace
        pHabilidad.classList.add("text-center", "me-4");
        pHabilidad.innerText=habilidades[i][1];


        let divAcordeon=document.createElement("div");//div acordeon
        divAcordeon.classList.add("accordion");

        let divAcordeonCard=document.createElement("div");//div tarjeta acordeon
        divAcordeonCard.classList.add("card", "ms-1", "me-5", "bg-secondary", "bg-opacity-75", "text-light");

        let divbtn=document.createElement("div");//div para el btn del acordeon
        divbtn.classList.add("card-header", "text-center");
        divbtn.id="boton-collapse-"+i;

        let btn=document.createElement("button");//boton del acordeon
        btn.classList.add("btn", "text-center");
        btn.setAttribute("data-bs-toggle","collapse");
        btn.setAttribute("data-bs-target","#contenido-btn-"+i);
        btn.setAttribute("aria-expanded","false");
        btn.setAttribute("aria-controls","contenido-btn-"+i);
        btn.innerHTML="<h4 class='text-light ps-2 pe-2 mt-2 mb-2'>Ubiación</h4>";

        let contenidoAcordeon=document.createElement("div");
        contenidoAcordeon.classList.add("collapse");
        contenidoAcordeon.id="contenido-btn-"+i;
        contenidoAcordeon.setAttribute("aria-labelledby","boton-collapse-1");
        contenidoAcordeon.setAttribute("data-bs-parent", "#acordeon001");

        let cont=document.createElement("div");//contenido oculto
        cont.classList.add("card-body", "text-center");

        cont.innerHTML+="<p class='text-center'>"+habilidades[i][3]+"</p>";

        contenidoAcordeon.appendChild(cont);

        /* agregacion individuales */
        /* cuerpo 1 */
        col2.appendChild(img);

        col3.appendChild(h3);

        row2.appendChild(col2);
        row2.appendChild(col3);

        /* cuerpo2 */
        divHabilidad.appendChild(h3Habilidad);
        divHabilidad.appendChild(pHabilidad);

        /* acordeon */

        divbtn.appendChild(btn);
        divAcordeonCard.appendChild(divbtn);
        divAcordeonCard.appendChild(contenidoAcordeon);
        divAcordeon.appendChild(divAcordeonCard);

        /* body1 */
        body1.appendChild(row2);
        body1.innerHTML+="<hr>";
        body1.appendChild(divHabilidad);
        body1.innerHTML+="<hr>";
        body1.appendChild(divAcordeon);

        divCardBody.appendChild(body1);

        divCard.appendChild(divCardBody);
        divCol.appendChild(divCard);
        divRow.appendChild(divCol);
    }    

    /* agregacion */

    divContainer.appendChild(divRow);
    poder.appendChild(divContainer);
})