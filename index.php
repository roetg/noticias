<?php
include 'includes/conexion.php';
//echo "Conexión exitosa a la base de datos";
?>

 <!-- Consultar Noticias Destacadas  -->
<?php
$querySlider = "SELECT * FROM articulos WHERE destacado = TRUE ORDER BY fecha_publicacion DESC";
$resultadoSlider = $conexion->query($querySlider);
?>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Noticias</title>
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
     <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>

    <!-- Slider -->
  <!-- Slider de Noticias Destacadas -->
<div id="sliderNoticias" class="carousel slide mb-4" data-bs-ride="carousel">
    <div class="carousel-inner">
        <?php if ($resultadoSlider->num_rows > 0): ?>
            <?php $activo = true; ?>
            <?php while ($filaSlider = $resultadoSlider->fetch_assoc()): ?>
                <div class="carousel-item <?php echo $activo ? 'active' : ''; ?>">
                    <img src="imagenes/<?php echo $filaSlider['imagen']; ?>" class="d-block w-100" alt="<?php echo $filaSlider['titulo']; ?>">
                    <div class="carousel-caption d-none d-md-block">
                        <h5><?php echo $filaSlider['titulo']; ?></h5>
                        <p><?php echo substr($filaSlider['contenido'], 0, 100); ?>...</p>
                    </div>
                </div>
                <?php $activo = false; ?>
            <?php endwhile; ?>
        <?php else: ?>
            <p>No hay noticias destacadas.</p>
        <?php endif; ?>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#sliderNoticias" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Anterior</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#sliderNoticias" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Siguiente</span>
    </button>
</div>



    

    <!-- Contenedor principal de noticias-->
    <div class="container-fluid mt-4">
        <div class="row">
            <!-- Centro deslizable (Noticias) -->
            <!-- Centro deslizable (Noticias) -->
<div class="col-md-8" id="centro-deslizable">
    <?php if ($resultado->num_rows > 0): ?>
        
         <!-- Añadir Botones de Interacción -->
        <?php while($fila = $resultado->fetch_assoc()): ?>
     <div class="articulo">
        <h2><?php echo $fila['titulo']; ?></h2>
        <img src="imagenes/<?php echo $fila['imagen']; ?>" alt="<?php echo $fila['titulo']; ?>">
        <p><?php echo substr($fila['contenido'], 0, 100); ?>...</p>
        <button class="btn-me-gusta" data-id="<?php echo $fila['id']; ?>">❤️ Me gusta (<span class="contador-me-gusta"><?php echo $fila['me_gusta']; ?></span>)</button>
        <button class="btn-reproduccion" data-id="<?php echo $fila['id']; ?>">👁️ Reproducciones (<span class="contador-reproduccion"><?php echo $fila['reproducciones']; ?></span>)</button>
     </div>
<?php endwhile; ?>


    <?php else: ?>
        <p>No hay noticias disponibles.</p>
    <?php endif; ?>
</div>



            <!-- Lado derecho fijo (Tendencias) -->
            <div class="col-md-4" id="lado-fijo">
                <h4>Tendencias</h4>
                <ul class="list-group">
                    <li class="list-group-item">Tendencia 1</li>
                    <li class="list-group-item">Tendencia 2</li>
                    <li class="list-group-item">Tendencia 3</li>
                </ul>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Funcionalidad Dinámica Botones de Interacción me gusta reproducir -->
    <script>
    document.querySelectorAll('.btn-me-gusta').forEach(boton => {
        boton.addEventListener('click', function() {
            let idArticulo = this.getAttribute('data-id');
            fetch(`reaccionar.php?tipo=me_gusta&id=${idArticulo}`)
                .then(response => response.text())
                .then(data => {
                    if (data !== 'error') {
                        this.querySelector('.contador-me-gusta').innerText = data;
                    }
                });
        });
    });

    document.querySelectorAll('.btn-reproduccion').forEach(boton => {
        boton.addEventListener('click', function() {
            let idArticulo = this.getAttribute('data-id');
            fetch(`reaccionar.php?tipo=reproduccion&id=${idArticulo}`)
                .then(response => response.text())
                .then(data => {
                    if (data !== 'error') {
                        this.querySelector('.contador-reproduccion').innerText = data;
                    }
                });
        });
    });
</script>


</body>

<script src="js/script.js"></script>


</html>
