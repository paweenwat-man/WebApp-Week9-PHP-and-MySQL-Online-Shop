<?php
$title = "Order Details";
include_once("templates/header.php");
require_once("database.php");
require_once("helpers/datetime.php");
?>
<?php if (isset($_GET["id"])) :
  $sql = "SELECT * FROM order_product WHERE id = :id";
  $stmt = $conn->prepare($sql);
  $stmt->bindParam(":id", $_GET["id"]);
  $stmt->execute();
  $stmt->setFetchMode(PDO::FETCH_ASSOC);
  $customer = $stmt->fetch();
  $sql = "SELECT * FROM order_product op JOIN order_details od ON op.id = od.order_id JOIN products p ON p.id = od.product_id WHERE op.id = :id";
  $stmt = $conn->prepare($sql);
  $stmt->bindParam(":id", $_GET["id"]);
  $stmt->execute();
  $stmt->setFetchMode(PDO::FETCH_ASSOC);
  $order_details = $stmt->fetchAll();
  $sum = 0;
?>
  <div class="container-fluid">
    <div class="my-2">
      <a class="btn btn-primary float-start" href="order_details.php" role="button">ย้อนกลับ</a>
      <h4 class="text-center">รายการสั่งซื้อของ <?= $customer["fname"] . " " . $customer["lname"] ?></h4>
      <h6 class="text-center">สั่งซื้อวันที่่ <?= getThaiDateTime($customer["order_date"]) ?></h6>
    </div>
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
                <th>Image</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($order_details as $i => $detail) :
                $sum += $detail["price"];
              ?>
                <tr>
                  <td><?= $i + 1 ?></td>
                  <td><?= $detail["id"] ?></td>
                  <td><?= $detail["name"] ?></td>
                  <td><?= $detail["description"] ?></td>
                  <td><?= $detail["price"] ?></td>
                  <td><img class="img img-thumbnail img-fluid" src="<?= $detail["image"] ?>" alt=""></td>
                </tr>
              <?php endforeach ?>
            </tbody>
          </table>
          <h4>ราคาสินค้า <?= $sum ?> บาท</h4>
        </div>
      </div>
      <div class="col-lg-6 col-xl-4">
        <div class="card">
          <div class="card-header">
            <h4>ข้อมูลส่วนตัว</h4>
          </div>
          <div class="card-body">
            <div class="form-group mb-3">
              <label class="form-label" for="fname">ชื่อ</label>
              <h6 class="form-control" id="fname"><?= $customer["fname"] ?></h6>
            </div>
            <div class="form-group mb-3">
              <label class="form-label" for="lname">นามสกุล</label>
              <h6 class="form-control" id="lname"><?= $customer["lname"] ?></h6>
            </div>
            <div class="form-group mb-3">
              <label class="form-label" for="address">ที่อยู่จัดส่ง</label>
              <h6 class="form-control" id="address"><?= $customer["address"] ?></h6>
            </div>
            <div class="form-group mb-3">
              <label class="form-label" for="mobile">เบอร์โทรศัพท์</label>
              <h6 class="form-control" id="mobile"><?= $customer["mobile"] ?></h6>
            </div>
            <div class="form-group mb-3">
              <label class="form-label" for="order_date">วันที่สั่งซื้อ</label>
              <h6 class="form-control"> <?= getThaiDateTime($customer["order_date"]) ?></h6>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<?php else :
  $sql = "SELECT op.*, SUM(p.price) as total_price FROM order_product op JOIN order_details od ON op.id = od.order_id JOIN products p ON p.id = od.product_id GROUP BY op.id ORDER BY op.order_date DESC";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  $stmt->setFetchMode(PDO::FETCH_ASSOC);
  $customers = $stmt->fetchAll();
?>
  <div class="container-fluid">
    <h4 class="text-center m-2">ใบสั่งซื้อ</h4>
    <div class="table-responsive">
      <table class="table table-hover table-bordered">
        <thead>
          <tr>
            <th>ลำดับ</th>
            <th>ID</th>
            <th>ชื่อ-นามสกุล</th>
            <th>ที่อยู่</th>
            <th>วันที่สั่งซื้อ</th>
            <th>ราคาสินค้ารวม</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($customers as $i => $customer) : ?>
            <tr>
              <td><?= $i + 1 ?></td>
              <td><?= $customer["id"] ?></td>
              <td><?= $customer["fname"] . " " . $customer["lname"] ?></td>
              <td><?= $customer["address"] ?></td>
              <td><?= getThaiDateTime($customer["order_date"]) ?></td>
              <td><?= $customer["total_price"] ?> บาท</td>
              <td><a class="btn btn-primary" href="<?= "order_details.php?id=" . $customer["id"] ?>" role="button">รายการสั่งซื้อ</a></td>
            </tr>
          <?php endforeach ?>
        </tbody>
      </table>
    </div>

  </div>
<?php endif ?>

<?php include_once("templates/footer.php") ?>