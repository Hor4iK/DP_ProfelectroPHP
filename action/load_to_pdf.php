<?php

require_once __DIR__ . '/../helpers.php';
include_once __DIR__ . '/../libs/dompdf/autoload.inc.php';


function format_price($value)
{
	return number_format($value, 2, ',', ' ');
}

$html = '
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	
	<style type="text/css">
	* {font-family: DejaVu Sans;font-size: 14px;line-height: 14px;}
	table {margin: 0 0 15px 0;width: 100%;border-collapse: collapse;border-spacing: 0;}		
	table th {padding: 5px;font-weight: bold;}        
	table td {padding: 5px;}	
	.header {margin: 0 0 0 0;padding: 0 0 15px 0;font-size: 12px;line-height: 12px;text-align: center;}
	h1 {margin: 0 0 10px 0;padding: 10px 0;border-bottom: 2px solid #000;font-weight: bold;font-size: 20px;}
		
	
 
	/* Наименование товара, работ, услуг */
	.list thead, .list tbody  {border: 2px solid #000;}
	.list thead th {padding: 4px 0;border: 1px solid #000;vertical-align: middle;text-align: center;}	
	.list tbody td {padding: 0 2px;border: 1px solid #000;vertical-align: middle;font-size: 11px;line-height: 13px;}	
	.list tfoot th {padding: 3px 2px;border: none;text-align: right;}	
 
 	/* Сумма */
	.total {margin: 0 0 20px 0;padding: 0 0 10px 0;border-bottom: 2px solid #000;}	
	.total p {margin: 0 ;padding: 0;}
		
	</style>
</head>
<body>

<table class="details">
		<tbody>
			<tr>
				<td style="border-bottom: none;"><img src="../img/Логотип-Профэлектро.png" alt="Логотип компании ПрофЭлектро с изображением капли и шестерёнки" class="header__logo-image" /></td>
				<tr>
					<td align="right" style="border-bottom: none;">г.Ростов-на-Дону, ул.Еременко 99</td>
				</tr>
				<tr>
					<td align="right">г.Ростов-на-Дону, ул.Сиверса 28а</td>
				</tr>
				<tr>
					<td align="right" style="border-bottom: none;">г. Батайск, ул. Куйбышева 108</td>
				</tr>
				<tr>
					<td align="right" >Село Новобатайск, ул. Ленина 61б</td>
				</tr>
			</tr>
				
		</tbody>
	</table>	
 

	<h1>Прайс-лист</h1>
 
	<table class="list">
		<thead>
			<tr>
				<th width="5%">№</th>
				<th width="35%">Наименование товара</th>
				<th width="5%">Артикул</th>
				<th width="5%">Ед.изм.</th>
				<th width="20%">Цена</th>
			</tr>
		</thead>
		<tbody>';
		
		$products = getGoods(0);

		$total = 0;
		foreach ($products as $i => $product) {
			$total += $product['good_price'];
 
			$html .= '
			<tr>
				<td align="center">' . (++$i) . '</td>
				<td align="left">' . $product['good_name'] . '</td>
				<td align="left">' . (++$i) . '</td>
				<td align="left">' . $product['good_unit'] . '</td>
				<td align="left">'. format_price($product['good_price']) . ' Руб.</td>
			</tr>';
		}
 
		$html .= '
		</tbody>
		
		<tfoot>
			<tr>
				<th colspan="4">Итого:</th>
				<th>' . format_price($total) . ' Руб.</th>
			</tr>
		</tfoot>
	</table>
</body>
</html>';


$dompdf = new Dompdf\Dompdf();
$dompdf->set_option('isRemoteEnabled', TRUE);
$dompdf->setPaper('A4', 'portrait');
$dompdf->loadHtml($html, 'UTF-8');
$dompdf->render();
 
// Вывод файла в браузер:
$dompdf->stream('price_list'); 
?>