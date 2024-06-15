<?php

require_once __DIR__ . '/../helpers.php';


header('Content-Type: application/json');
$data = json_decode(file_get_contents('php://input'), true);
$aResult = array();

switch ($data['funcName']) {
  case 'addGoodCartFromBtn':
    $_COOKIE['idCard'] = $data['arguments']['idCard'];
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
  case 'deleteGood':
    $aResult['response'] = deleteGood($data['arguments']['cardsId']);
    echo json_encode($aResult);
    break;
  case 'addGood':
    $aResult['response'] = addGood();
    echo json_encode($aResult);
    break;
  case 'setPaidGood':
    $products = array();
    $products[] = getCart();
    $aResult['response'] = $products[0];
    foreach ($products[0] as $product) {
      $aResult['response'] = setPaidGood($product['cart_id'], $product['good_id'], $product['user_id']);
    }
    unset($product);
    echo json_encode($aResult);
    break;
  case 'changeGoodCart':
    $aResult['response'] = changeGoodCart($data['arguments']['cardId'], $data['arguments']['count']);
    echo json_encode($aResult);
    break;
  case 'getCart':
    $aResult['response'] = getCart();
    echo json_encode($aResult);
    break;
  case 'getGoodsBySearch':
    $aResult['response'] = getGoodsBySearch($data['arguments']['search']);
    echo json_encode($aResult);
    break;
  default:
    $aResult['error'] = 'Not found function ' . $data['funcName'] . '!';
    echo json_encode($aResult);
    break;
}
