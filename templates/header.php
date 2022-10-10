<?php
session_start();
?>
<!DOCTYPE html>
<html>

<head>
  <title><?= $title ?></title>
  <link rel="icon" type="image/png" href="https://upload.wikimedia.org/wikipedia/commons/9/97/KU_Logo.png">
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body>
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="javascript:void(0)">
        <img src="https://upload.wikimedia.org/wikipedia/commons/9/97/KU_Logo.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
        Online Shop
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-link" href="show_product.php">รายการสินค้า</a>
          <a class="nav-link" href="order_details.php">ใบสั่งซื้อ</a>
        </div>
      </div>
    </div>
  </nav>