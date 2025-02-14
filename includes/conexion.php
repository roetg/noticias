<?php
$servidor = "localhost";
$usuario = "root";
$contrasena = "";
$base_datos = "noticias_db";

$conexion = new mysqli($servidor, $usuario, $contrasena, $base_datos);

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
?>
<?php
$query = "SELECT a.id, a.titulo, a.contenido, a.imagen, a.fecha_publicacion, 
          (SELECT COUNT(*) FROM reacciones r WHERE r.id_articulo = a.id AND r.tipo = 'me_gusta') AS me_gusta,
          (SELECT COUNT(*) FROM reacciones r WHERE r.id_articulo = a.id AND r.tipo = 'reproduccion') AS reproducciones
          FROM articulos a ORDER BY fecha_publicacion DESC";
$resultado = $conexion->query($query);
?>

<?php
$query = "SELECT * FROM articulos ORDER BY fecha_publicacion DESC";
$resultado = $conexion->query($query);
?>
