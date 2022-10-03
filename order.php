<?php
session_start();
require_once("database.php");
$sql = "INSERT INTO order_product (fname, lname, address, mobile) VALUES (:fname, :lname, :address, :mobile)";
$stmt = $conn->prepare($sql);
$stmt->execute($_POST);

$lastID = $conn->lastInsertId();

$sql = "INSERT INTO order_details (order_id, product_id) VALUES (:order_id, :product_id)";
$stmt = $conn->prepare($sql);

foreach ($_SESSION["cart"] as $i => $product) {
  $values = [
    ":order_id" => $lastID,
    ":product_id" => $product["id"]
  ];
  $stmt->execute($values);
}

$_SESSION["cart"] = [];

// echo "<pre>";
// echo $lastID . "<br>";
// print_r($_POST);
// echo "</pre>";
header("refresh: 0; url=/order_details.php?id=".$lastID);

?>

<script>
  window.alert("สั่งซื้อสินค้าเรียบร้อยแล้ว");
</script>