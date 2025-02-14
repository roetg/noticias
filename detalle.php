<?php
// Conectar a la base de datos
include 'conexion.php';

// Verificar si se ha pasado un ID válido en la URL
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    
    // Aumentar el contador de reproducciones
    $actualizar = "UPDATE articulos SET reproducciones = reproducciones + 1 WHERE id = $id";
    $conexion->query($actualizar);
    
    // Obtener los datos de la noticia
    $consulta = "SELECT titulo, contenido, imagen, reproducciones FROM articulos WHERE id = $id";
    $resultado = $conexion->query($consulta);

    // Verificar si se encontró la noticia
    if ($resultado->num_rows > 0) {
        $fila = $resultado->fetch_assoc();
        echo "<h1>" . $fila['titulo'] . "</h1>";
        echo "<img src='imagenes/" . $fila['imagen'] . "' alt='" . $fila['titulo'] . "'>";
        echo "<p>" . $fila['contenido'] . "</p>";
        echo "<span>👁️ Reproducciones: " . $fila['reproducciones'] . "</span>";
    } else {
        echo "<h2>No se encontró la noticia.</h2>";
    }
} else {
    echo "<h2>ID de noticia no válido.</h2>";
}
?>
