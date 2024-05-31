<?php


require_once __DIR__ . '/../helpers.php';


$password = $_POST['password'] ?? null;
$password_again = $_POST['password_again'] ?? null;


$userId = currentUserAccount();


if (empty($password)) {
  $_SESSION['validation']['password'] = 'Неправильно указан пароль';
  header('Location: ' . $_SERVER['HTTP_REFERER']);
  die();
}

if ($password_again != $password) {
  $_SESSION['validation']['password_again'] = 'Неправильно указан пароль';
  header('Location: ' . $_SERVER['HTTP_REFERER']);
  die();
}


$pdo = getPDO();

$query = "UPDATE users SET password = :password WHERE id = :id";
$params = [
  'password' => password_hash($password, algo:PASSWORD_DEFAULT),
  'id' => $userId['id']
];
$stmt = $pdo->prepare($query);

try {
  $stmt->execute($params);
} catch (\Exception $e) {
  die($e->getMessage());
}


header('Location: ' . $_SERVER['HTTP_REFERER']);
