<?php


session_start();


require_once __DIR__ . '/../helpers.php';


$login = $_POST['login'];
$password = $_POST['password'];


$_SESSION['validation'] = [];


if (empty($login)) {
  $_SESSION['validation']['login'] = 'Неправильно указана почта';
  setMessage(key: 'error', message: 'Ошибка валидации');
  die(header('Location: ' . $_SERVER['HTTP_REFERER']));
}

if (empty($password)) {
  $_SESSION['validation']['password'] = 'Неправильно указан пароль';
}

$pdo = getPDO();

$stmt = $pdo->prepare(query:"SELECT * FROM users WHERE email = :email");
$stmt->execute(['email' => $login]);
$user = $stmt->fetch(mode: \PDO::FETCH_ASSOC);

if(!$user) {
  setMessage(key: 'error', message:"Пользователь $login не найден");
  header('Location: ' . $_SERVER['HTTP_REFERER']);
  // die();
}

if (!password_verify($password, $user['password'])) {
  setMessage(key: 'error', message:"Неверный пароль");
  header('Location: ' . $_SERVER['HTTP_REFERER']);
  // die();
}


$_SESSION['user']['id'] = $user['id'];
$_SESSION['user']['login'] = $user['email'];
$_SESSION['user']['password'] = $user['password'];


redirect(path: '../content/account.php');
