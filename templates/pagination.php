<nav aria-label="Page navigation">
  <h5 class="text-center mt-2"><?= $total." รายการ, ".$totalPage." หน้า" ?></h5>
  <ul class="pagination justify-content-center">
    <li class="page-item <?= $page > 1 ? "" : "disabled" ?>">
      <a class="page-link" href="<?= $page > 1 ? "show_product.php?page=".($page-1) : "javascript:void(0)" ?>">Previous</a>
    </li>
    <?php for ($i = 1; $i <= $totalPage; $i++): ?>
    <li class="page-item">
      <a class="page-link" href="show_product.php?page=<?= $i ?>"><?= $i ?></a>
    </li>
    <?php endfor ?>
    <li class="page-item <?= $page < $totalPage ? "" : "disabled" ?>">
      <a class="page-link" href="<?= $page < $totalPage ? "show_product.php?page=".($page+1) : "javascript:void(0)" ?>">Next</a>
    </li>
  </ul>
</nav>