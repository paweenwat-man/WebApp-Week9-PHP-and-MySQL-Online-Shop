<?php
$title = "Checkout Product";
include_once("templates/header.php");
?>

<div class="container-fluid">
  <a class="btn btn-primary float-start" href="show_product.php" role="button">ย้อนกลับ</a>
  <h4 class="text-center my-3">สรุปรายการสินค้า</h4>
  <div class="row">
    <div class="col-lg-6 col-xl-8">
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
        <h4 class="float-start">ราคาสินค้า <?= $sum ?> บาท</h4>
        <a class="btn btn-danger float-end" href="delete_product.php">ลบสินค้าทั้งหมด</a>
      </div>
    </div>
    <div class="col-lg-8 col-xl-4">
      <div class="card">
        <div class="card-body">
          <form action="order.php" method="post">
            <div class="form-group mb-3">
              <label class="form-label" for="fname">ชื่อ</label>
              <input class="form-control" type="text" id="fname" name="fname">
            </div>
            <div class="form-group mb-3">
              <label class="form-label" for="lname">นามสกุล</label>
              <input class="form-control" type="text" id="lname" name="lname">
            </div>
            <div class="form-group mb-3">
              <label class="form-label" for="address">ที่อยู่</label>
              <textarea class="form-control" id="address" name="address" rows="3"></textarea>
            </div>
            <div class="form-group mb-3">
              <label class="form-label" for="mobile">เบอร์โทรศัพท์</label>
              <input class="form-control" type="tel" id="mobile" name="mobile">
            </div>
            <button type="submit" class="btn btn-primary float-end">ยืนยันการสั่งซื้อ</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<?php include_once("templates/footer.php") ?>