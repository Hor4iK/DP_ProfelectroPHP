<?php

session_start();

require_once __DIR__ . './config.php';


function redirect(string $path)
{
  header(header: "Location: $path");
  die();
}


//VALIDATION
function clearValidation()
{
  $_SESSION['validation'] = [];
  // $_SESSION['class'] = null;
}

function getPDO(): PDO
{
  try {
    return new \PDO(dsn: 'mysql:host=' . db_host . '; charset=utf8; dbname=' . db_name, username: db_username, password: db_password);
  } catch (\PDOException $e) {
    die("Connection error: {$e->getMessage()}");
  }
}

function setMessage(string $key, string $message): void
{
  $_SESSION['message'][$key] = $message;
}

function hasMessage(string $key): bool
{
  return isset($_SESSION['message'][$key]);
}

function getMessage(string $key): string
{
  $message = $_SESSION['message'][$key] ?? '';
  unset($_SESSION['message'][$key]);
  return $message;
}


//currentUser
function currentUser(): array|false
{
  $pdo = getPDO();

  if (!isset($_SESSION['user'])) {
    return false;
  }
  $userId = $_SESSION['user']['id'] ?? null;

  $stmt = $pdo->prepare(query: "SELECT * FROM users WHERE id = :id");
  $stmt->execute(['id' => $userId]);
  return $stmt->fetch(mode: \PDO::FETCH_ASSOC);
}

function currentUserAccount(): array
{
  $pdo = getPDO();

  $userId = $_SESSION['user']['id'] ?? null;

  $stmt = $pdo->prepare(query: "SELECT * FROM users WHERE id = :id");
  $stmt->execute(['id' => $userId]);
  return $stmt->fetch(mode: \PDO::FETCH_ASSOC);
}


//GOODS FUNCTIONS
function getGoods(int $Category): array
{
  $pdo = getPDO();

  if ($Category != 0)
    $result = $pdo->prepare(query: "SELECT goods.*, category.category_id, category.category_name FROM goods, category WHERE category.category_id = goods.category_id and category.category_id = $Category");
  else
    $result = $pdo->prepare(query: "SELECT * FROM goods");
  $result->execute();
  $products = array();

  while ($product_info = $result->fetch(mode: \PDO::FETCH_ASSOC)) {
    $products[] = $product_info;
  };

  return $products;
}

function getGoodsPodcategory(int $Category, int $Podcategory): array
{
  $pdo = getPDO();

  if ($Category != 0 && $Podcategory != 0)
    $result = $pdo->prepare(query: "SELECT goods.*, category.category_id, category.category_name, podcategory.podcategory_id, podcategory.podcategory_name FROM goods, category, podcategory WHERE (category.category_id = goods.category_id and category.category_id = $Category) and (podcategory.podcategory_id = goods.good_podcategory_id and podcategory.podcategory_id = $Podcategory)");
  $result->execute();
  $products = array();

  while ($product_info = $result->fetch(mode: \PDO::FETCH_ASSOC)) {
    $products[] = $product_info;
  };

  return $products;
}

function getCategory(): array
{
  $pdo = getPDO();
  $result = $pdo->prepare(query: "SELECT category_id, category_name, category_image FROM category");
  $result->execute();
  $category = array();

  while ($category_info = $result->fetch(mode: \PDO::FETCH_ASSOC)) {
    $category[] = $category_info;
  };

  return $category;
}

function getPodcategory(int $Podcategory): array
{
  $pdo = getPDO();
  $result = $pdo->prepare(query: "SELECT podcategory.* FROM podcategory WHERE podcategory_id= $Podcategory");
  $result->execute();
  $podcategory = array();

  while ($podcategory_info = $result->fetch(mode: \PDO::FETCH_ASSOC)) {
    $podcategory[] = $podcategory_info;
  };

  return $podcategory;
}

function getPodcategories(int $Category): array
{
  $pdo = getPDO();
  if ($Category != 0)
    $result = $pdo->prepare(query: "SELECT podcategory_id, podcategory_name, podcategory_image, podcategory_affiliation FROM podcategory WHERE podcategory_affiliation = $Category");
  else
    return null;
  $result->execute();
  $podcategory = array();

  while ($podcategory_info = $result->fetch(mode: \PDO::FETCH_ASSOC)) {
    $podcategory[] = $podcategory_info;
  };

  return $podcategory;
}

function getGoodByID(int $idCard): array
{
  $pdo = getPDO();
  if ($idCard == null) {
    $idCard = $_COOKIE['idCard'];
  }
  $result = $pdo->prepare(query: "SELECT * FROM goods WHERE good_id = $idCard");
  $result->execute();
  $products = array();

  while ($product_info = $result->fetch(mode: \PDO::FETCH_ASSOC)) {
    $products[] = $product_info;
  };
  return $products;
}


//CART FUNCTIONS
function getCart(): array
{
  $pdo = getPDO();
  $user = $_SESSION['user']['id'];
  $result = $pdo->prepare(query: "SELECT cart.good_id, good_name, good_image, good_overview, good_provider, good_price, good_count, round((good_price * good_count), 2) as good_summ, good_unit from goods, cart WHERE goods.good_id = cart.good_id and user_id = $user and is_paid = 0");
  $result->execute();
  $products = array();
  while ($product_info = $result->fetch(mode: \PDO::FETCH_ASSOC)) {
    $products[] = $product_info;
  }
  return $products;
}

function addGoodCartFromBtn():string
{
  $idUser = $_SESSION['user']['id'];
  $idCard = $_COOKIE['idCard'];
  try {
    $pdo = getPDO();
    $result = $pdo->prepare(query: "INSERT INTO cart(user_id, good_id, good_count, is_paid) VALUES ($idUser, $idCard, 1, false)");
    $result->execute();
    return 'The product has been added to cart';
  }
  catch(Exception $err) {
    return $err;
  }
}

function addGoodCartFromPopup($countGood):string
{
  $idUser = $_SESSION['user']['id'];
  $idCard = $_COOKIE['idCard'];
  try {
    $pdo = getPDO();
    $result = $pdo->prepare(query: "INSERT INTO cart(user_id, good_id, good_count, is_paid) VALUES ($idUser, $idCard, $countGood, false)");
    $result->execute();
    return 'The product has been added to cart';
  }
  catch(Exception $err) {
    return $err;
  }
}

function deleteGoodFromCart($countGood):string
{
  $idUser = $_SESSION['user']['id'];
  $idCard = $_COOKIE['idCard'];
  try {
    $pdo = getPDO();
    $result = $pdo->prepare(query: "DELETE FROM cart WHERE user_id = $idUser and good_id = $idCard and good_count = $countGood");
    $result->execute();
    return 'The product has been deleted';
  }
  catch(Exception $err) {
    return $err;
  }
}

function getPaidGoods(): array
{
  $pdo = getPDO();
  $user = $_SESSION['user']['id'];
  $result = $pdo->prepare(query: "SELECT cart.good_id, good_name, good_image, good_overview, good_provider, good_price, good_count, round((good_price * good_count), 2) as good_summ, good_unit from goods, cart WHERE goods.good_id = cart.good_id and user_id = $user and is_paid = 1");
  $result->execute();
  $products = array();
  while ($product_info = $result->fetch(mode: \PDO::FETCH_ASSOC)) {
    $products[] = $product_info;
  }

  return $products;
}
