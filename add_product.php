<?php
session_start();
if (!isset($_SESSION["cart"])) {
  $_SESSION["cart"] = [];
}

require_once("database.php");
$sql = "SELECT * FROM products WHERE id = :id";
$stmt = $conn->prepare($sql);
$stmt->bindParam(":id", $_GET["id"]);
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_ASSOC);
$product = $stmt->fetch();
array_push($_SESSION["cart"], $product);
$conn = null;

header("refresh: 0; url=".$_SERVER["HTTP_REFERER"]);
print_r($_SESSION["cart"]);
?>

<script>
  window.alert("เพิ่มสินค้าลงในรถเข็นเรียบร้อยแล้ว");
</script>