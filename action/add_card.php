<?php

  require_once __DIR__ . '/../helpers.php';

  function addGood(): string
  {
    try {
      $name = (string)$_POST['name'];
      $image = (string)$_POST['image'];
      $overview = (string)$_POST['overview'];
      $price = (float)$_POST['price'];
      $unit = (string)$_POST['unit'];
      $provider = (string)$_POST['provider'];
      $podcategory = (int)$_POST['podcategory'];
      $podcategoryInfo = getPodcategory($podcategory);
      $category = $podcategoryInfo[0]['podcategory_affiliation'];

      $pdo = getPDO();
      $result = $pdo->prepare(query: "INSERT INTO goods (good_name, good_overview, good_provider, good_price, good_image, good_unit, category_id, good_podcategory_id) VALUES ('$name', '$overview', '$provider', $price,'$image', '$unit', $category, $podcategory)");
      $result->execute();
      return 'Successful adding of product';
    } catch (Exception $err) {
      return $err;
    }
  }

  addGood();
  redirect(path: '/content/admin.php');

?>
