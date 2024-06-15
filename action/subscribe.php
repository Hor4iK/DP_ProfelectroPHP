<?php

require_once __DIR__ . '/../helpers.php';

function addMail(): string
{
  try {
    $license = (string)$_POST['license'];

    $pdo = getPDO();
    $result = $pdo->prepare(query: "INSERT INTO mailing (mailing_name) VALUES ('$license')");
    $result->execute();
    return 'Successful adding to mailing';
  } catch (Exception $err) {
    return $err;
  }
}

addMail();
redirect(path: '/index.php');
