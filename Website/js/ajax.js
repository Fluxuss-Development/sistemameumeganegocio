function abrirPag(valor) {
    var url = valor;

    xmlRequest.open("GET", url, true);
    xmlRequest.onreadystatechange = mudancaEstado;
    xmlRequest.send(null);

    if (xmlRequest.readyState == 1) {
        document.getElementById("conteudo_mostrar").innerHTML = "<img src='loader.gif'>";
    }
    return url;
}

function mudancaEstado() {
    if (xmlRequest.readyState == 4) {
        document.getElementById("conteudo_mostrar").innerHTML = xmlRequest.responseText;
    }
}