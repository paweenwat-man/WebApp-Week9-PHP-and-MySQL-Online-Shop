<?php

$title = "Online Shop";
include_once("templates/header.php");

$page = $_GET["page"] ?? 1;
$perPage = $_GET["per_page"] ?? 10;

require_once("database.php");
$sql = "SELECT * FROM products";
$stmt = $conn->prepare($sql);
$stmt->execute();
$total = $stmt->rowCount();
$totalPage = ceil($total / $perPage);

$perPage = max(2, min(20, $perPage)); // clamp content per page
$page = max(1, min($totalPage, $page)); // clamp page number

$sql = "SELECT * FROM products LIMIT " . (($page - 1) * $perPage) . ", " . $perPage;
$stmt = $conn->prepare($sql);
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_ASSOC);
$products = $stmt->fetchAll();
$conn = null;

include("templates/pagination.php");

?>
<div class="container-fluid">
  <div class="row">
    <div class="col-lg-6 col-xl-8">
      <h4 class="text-center mb-3">รายการสินค้า</h4>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Description</th>
              <th>Price</th>
              <th>Image</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $i => $product) : ?>
              <tr>
                <td><?= $product["id"] ?></td>
                <td><?= $product["name"] ?></td>
                <td><?= $product["description"] ?></td>
                <td><?= $product["price"] ?></td>
                <td><img class="img img-fluid img-thumbnail" src="<?= $product["image"] ?>" alt=""></td>
                <td><a class="btn btn-primary" href="<?= "add_product.php?id=" . $product["id"] ?>" role="button">เพิ่มลงตะกร้า</a></td>
              </tr>
            <?php endforeach ?>
          </tbody>
        </table>
      </div>
    </div>
    <div class="col-lg-6 col-xl-4">
      <h4 class="text-center mb-3">ตะกร้าสินค้า</h4>
      <div class="table-responsive">
        <table class="table table-hover table-bordered">
          <thead>
            <tr>
              <th>ลำดับ</th>
              <th>ID</th>
              <th>Name</th>
              <th>Description</th>
              <th>Price</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <?php
            $sum = 0;
            if (!isset($_SESSION["cart"])) {
              $_SESSION["cart"] = [];
            }
            foreach ($_SESSION["cart"] as $i => $product) :
              $sum += $product["price"];
            ?>
              <tr>
                <td><?= $i + 1 ?></td>
                <td><?= $product["id"] ?></td>
                <td><?= $product["name"] ?></td>
                <td><?= $product["description"] ?></td>
                <td><?= $product["price"] ?></td>
                <td><a class="text-decoration-none" href="<?= "delete_product.php?i=" . $i ?>"><b style="color: red;">&#10060;</b></a></td>
              </tr>
            <?php endforeach ?>
          </tbody>
        </table>
      </div>

      <h4 class="float-start">ราคาสินค้า <?= $sum ?> บาท</h4>
      <div class="d-flex flex-row float-end">
        <a class="btn btn-danger" href="delete_product.php" role="button">ลบสินค้าทั้งหมด</a>
        <a class="btn btn-primary" href="checkout.php" role="button">สั่งสินค้า</a>
      </div>
    </div>
  </div>

</div>
<?php include("templates/pagination.php") ?>

<?php include_once("templates/footer.php") ?>