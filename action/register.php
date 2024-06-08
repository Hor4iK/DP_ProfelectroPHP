<?php

session_start();

require_once __DIR__ . '/../helpers.php';

//DATA


$name = $_POST['name'] ?? null;
$login = $_POST['login'] ?? null;
$phone = $_POST['phone'] ?? null;
$password = $_POST['password'] ?? null;
$password_again = $_POST['password_again'] ?? null;
// $user = currentUser();


//Validation


$_SESSION['validation'] = [];


if (empty($name)) {
  $_SESSION['validation']['name'] = 'Неправильно указано имя';
}

if (empty($login)) {
  $_SESSION['validation']['login'] = 'Неправильно указана почта';
}

if (empty($phone)) {
  $_SESSION['validation']['phone'] = 'Неправильно указан номер телефона';
}

if (empty($password)) {
  $_SESSION['validation']['password'] = 'Неправильно указан пароль';
}

if ($password_again != $password) {
  $_SESSION['validation']['password_again'] = 'Неправильно указан пароль';
}

if (!empty($_SESSION['validation'])) {
 die(redirect(path: './register.php'));
}


//ADD USER
$pdo = getPDO();

$query = "INSERT INTO users (name, email, phone, password) VALUES (:name, :email, :phone, :password)";
$params = [
  'name' => $name,
  'email' => $login,
  'phone' => $phone,
  'password' => password_hash($password, algo:PASSWORD_DEFAULT)
];
$stmt = $pdo->prepare($query);

try {
  $stmt->execute($params);
} catch (\Exception $e) {
  die($e->getMessage());
}

$stmt2 = $pdo->prepare(query:"SELECT * FROM users WHERE email = :email");
$stmt2->execute(['email' => $login]);
$user = $stmt2->fetch(mode: \PDO::FETCH_ASSOC);

$_SESSION['user']['id'] = $user['id'];
$_SESSION['user']['login'] = $user['email'];
$_SESSION['user']['password'] = $user['password'];

redirect(path: '/../content/account.php');

?>
