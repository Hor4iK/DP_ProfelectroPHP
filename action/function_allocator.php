<?php

require_once __DIR__ . '/../helpers.php';


header('Content-Type: application/json');
$data = json_decode(file_get_contents('php://input'), true);
$aResult = array();

switch ($data['funcName']) {
  case 'addGoodCartFromBtn':
    $_COOKIE['idCard'] = $data['arguments'];
    $aResult['response'] = addGoodCartFromBtn();
    echo json_encode($aResult);
    break;
  case 'deleteGoodFromCart':
    $_COOKIE['idCard'] = $data['arguments']['idCard'];
    $aResult['response'] = deleteGoodFromCart($data['arguments']['countGood']);
    echo json_encode($aResult);
    break;
    case 'addGoodCartFromPopup':
      $_COOKIE['idCard'] = $data['arguments']['idCard'];
      $aResult['response'] = addGoodCartFromPopup($data['arguments']['countGood']);
      echo json_encode($aResult);
      break;
  default:
    $aResult['error'] = 'Not found function ' . $data['funcName'] . '!';
    echo json_encode($aResult);
    break;
}
