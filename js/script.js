document.addEventListener("DOMContentLoaded", function() {
    // Botón Me Gusta
    document.querySelectorAll(".btn-me-gusta").forEach(boton => {
        boton.addEventListener("click", function() {
            const idArticulo = this.getAttribute("data-id");
            fetch(`reaccionar.php?tipo=me_gusta&id=${idArticulo}`)
                .then(res => res.text())
                .then(data => {
                    this.querySelector("span").innerText = data;
                });
        });
    });

    // Botón Reproducir
    document.querySelectorAll(".btn-reproducir").forEach(boton => {
        boton.addEventListener("click", function() {
            const idArticulo = this.getAttribute("data-id");
            fetch(`reaccionar.php?tipo=reproduccion&id=${idArticulo}`)
                .then(res => res.text())
                .then(data => {
                    this.querySelector("span").innerText = data;
                });
        });
    });
});
