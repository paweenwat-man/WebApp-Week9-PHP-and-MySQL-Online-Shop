<?php

session_start();
$i = $_GET["i"] ?? null;
if (isset($_SESSION["cart"])) {
  $i !== null ? array_splice($_SESSION["cart"], $i, 1) : $_SESSION["cart"] = [];
}

header("refresh: 0; url=/show_product.php");
print_r($_SESSION["cart"]);
?>
<script>
  window.alert("นำสินค้าออกจากตะกร้าเรียบร้อยแล้ว");
</script>