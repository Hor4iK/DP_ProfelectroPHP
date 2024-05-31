<?php


require_once __DIR__ . '/../helpers.php';


$name = $_POST['name'] ?? null;
$login = $_POST['login'] ?? null;
$phone = $_POST['phone'] ?? null;


$user = currentUserAccount();


$_SESSION['validation'] = [];


if (empty($name)) {
  $_SESSION['validation']['name'] = 'Неправильно указано имя';
  header('Location: ' . $_SERVER['HTTP_REFERER']);
  die();
}

if (empty($login)) {
  $_SESSION['validation']['login'] = 'Неправильно указана почта';
  header('Location: ' . $_SERVER['HTTP_REFERER']);
  die();
}

if (empty($phone)) {
  $_SESSION['validation']['phone'] = 'Неправильно указан номер телефона';
  header('Location: ' . $_SERVER['HTTP_REFERER']);
  die();
}

$pdo = getPDO();

$query = "UPDATE users SET name = :name, email = :email, phone = :phone WHERE id = :id";
$params = [
  'name' => $name,
  'email' => $login,
  'phone' => $phone,
  'id' => $_SESSION['user']['id']
];
$stmt = $pdo->prepare($query);

try {
  $stmt->execute($params);
} catch (\Exception $e) {
  die($e->getMessage());
}


// $_SESSION['user']['id'] = $user['id'];


header('Location: ' . $_SERVER['HTTP_REFERER']);
