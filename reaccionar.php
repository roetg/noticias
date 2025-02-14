<?php
include 'includes/conexion.php';

$tipo = $_GET['tipo'];
$idArticulo = intval($_GET['id']);

if ($tipo && $idArticulo) {
    $conexion->query("INSERT INTO reacciones (tipo, id_articulo) VALUES ('$tipo', $idArticulo)");

    // Contar reacciones actualizadas
    $resultado = $conexion->query("SELECT COUNT(*) as total FROM reacciones WHERE tipo='$tipo' AND id_articulo=$idArticulo");
    $fila = $resultado->fetch_assoc();
    echo $fila['total'];
}
?>

<?php
// Conexión a la base de datos Este archivo actualizará la base de datos cuando el usuario haga clic en "Me Gusta" o vea una noticia.
//include 'includes/conexion.php';

// Verificar si se pasó el parámetro 'tipo' e 'id'
if (isset($_GET['tipo']) && isset($_GET['id'])) {
    $tipo = $_GET['tipo'];
    $idArticulo = intval($_GET['id']);

    if ($tipo == 'me_gusta') {
        // Incrementar 'me_gusta'
        $query = "UPDATE articulos SET me_gusta = me_gusta + 1 WHERE id = $idArticulo";
    } elseif ($tipo == 'reproduccion') {
        // Incrementar 'reproducciones'
        $query = "UPDATE articulos SET reproducciones = reproducciones + 1 WHERE id = $idArticulo";
    }

    // Ejecutar la consulta
    if ($conexion->query($query) === TRUE) {
        // Obtener el nuevo valor
        $result = $conexion->query("SELECT $tipo FROM articulos WHERE id = $idArticulo");
        $fila = $result->fetch_assoc();
        echo $fila[$tipo]; // Retornar el nuevo valor
    } else {
        echo "error";
    }
} else {
    echo "error";
}
?>


