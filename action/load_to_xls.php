<?php

require_once __DIR__ . '/../helpers.php';
include_once __DIR__ . '/../libs/PhpSpreadsheet/autoload.inc.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;
use PhpOffice\PhpSpreadsheet\Style\{Font, Border, Alignment};

function format_price($value)
{
  return number_format($value, 2, ',', ' ');
}

// Initialization
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// Structure
$sheet->setCellValue('H2', 'г. Ростов-на-Дону, ул. Еременко 99');
$sheet->setCellValue('H3', 'г. Ростов-на-Дону, ул. Сиверса 28а');
$sheet->setCellValue('H4', 'г. Батайск, ул. Куйбышева 108');
$sheet->setCellValue('H5', 'Село Новобатайск, ул. Ленина 61б');
$sheet->setCellValue('B8', 'Прайс-лист');
$sheet->setCellValue('C10', '№');
$sheet->setCellValue('D10', 'Наименование');
$sheet->setCellValue('F10', 'Артикул');
$sheet->setCellValue('G10', 'Ед. изм.');
$sheet->setCellValue('H10', 'Цена');

$sheet->getColumnDimension('C')->setWidth(4.10);
$sheet->getColumnDimension('D')->setWidth(36.56);
$sheet->getColumnDimension('E')->setWidth(11.56);
$sheet->getColumnDimension('F')->setWidth(12.19);
$sheet->getColumnDimension('G')->setWidth(10.07);
$sheet->getColumnDimension('H')->setWidth(18.97);
$sheet->getColumnDimension('I')->setWidth(13.07);
$sheet->mergeCells('B8:I8');
$sheet->mergeCells('D10:E10');

// Styles sheets
$sheet->getStyle('B8')->applyFromArray([
  'font' => [
    'bold' => true,
    'italic' => false,
    'strikethrough' => false,
    'size' => '20',
  ],
]);

$columns = array('C', 'D', 'E', 'F', 'G', 'H');

foreach ($columns as $column)
  $sheet->getStyle($column . 10)->applyFromArray([
    'font' => [
      'bold' => true,
      'italic' => false,
      'strikethrough' => false,
    ],
    'borders' => [
      'allBorders' => [
        'borderStyle' => Border::BORDER_THIN,
      ],
    ],
    'alignment' => [
      'horizontal' => Alignment::HORIZONTAL_CENTER,
      'vertical' => Alignment::VERTICAL_CENTER,
      'wrapText' => true,
    ]
  ]);


// Logo
$drawing = new Drawing();
$drawing->setPath(__DIR__ . '/../img/Логотип-Профэлектро.png');
$drawing->setCoordinates('B2');
$drawing->setWorksheet($sheet);
$drawing->setHeight(200);
$drawing->setWidth(200);

// Data
$products = getGoods(0);

$total = 0;
$column_number = 11;

foreach ($products as $i => $product) {

  // Sizes
  $sheet->getRowDimension($column_number)->setRowHeight(38.3);
  $sheet->mergeCells('D' . $column_number . ':E' . $column_number);



  // Styles
  $columns = array('C', 'E', 'F', 'G', 'H');
  foreach ($columns as $column)
    $sheet->getStyle($column . $column_number)->applyFromArray([
      'font' => [
        'bold' => true,
        'italic' => false,
        'strikethrough' => false,
      ],
      'borders' => [
        'allBorders' => [
          'borderStyle' => Border::BORDER_THIN,
        ],
      ],
      'alignment' => [
        'horizontal' => Alignment::HORIZONTAL_CENTER,
        'vertical' => Alignment::VERTICAL_CENTER,
        'wrapText' => true,
      ]
    ]);

  $sheet->getStyle('D' . $column_number)->applyFromArray([
    'font' => [
      'bold' => true,
      'italic' => false,
      'strikethrough' => false,
    ],
    'borders' => [
      'allBorders' => [
        'borderStyle' => Border::BORDER_THIN,
      ],
    ],
    'alignment' => [
      'horizontal' => Alignment::HORIZONTAL_LEFT,
      'vertical' => Alignment::VERTICAL_CENTER,
      'wrapText' => true,
    ]
  ]);


  $total += $product['good_price'];
  $sheet->setCellValue('C' . $column_number, ++$i);
  $sheet->setCellValue('D' . $column_number, $product['good_name']);
  $sheet->setCellValue('F' . $column_number, $product['good_id']);
  $sheet->setCellValue('G' . $column_number, $product['good_unit']);
  $sheet->setCellValue('H' . $column_number, format_price($product['good_price']) . ' руб.');
  $column_number++;
}

$sheet->setCellValue('H' . ++$column_number, 'Итого:');
$sheet->setCellValue('I' . $column_number, format_price($total));
$sheet->setCellValue('J' . $column_number, 'руб.');

// Styles
$columns = array('H', 'I', 'J');

foreach ($columns as $column)
  $sheet->getStyle($column . $column_number)->applyFromArray([
    'font' => [
      'bold' => true,
      'italic' => false,
      'strikethrough' => false,
    ],
  ]);

header("Expires: Mon, 1 Apr 1974 05:00:00 GMT");
header("Last-Modified: " . gmdate("D,d M YH:i:s") . " GMT");
header("Cache-Control: no-cache, must-revalidate");
header("Pragma: no-cache");
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=Прайс-лист_товаров_профэлектро.xls");

$writer = new Xls($spreadsheet);
$writer->save('php://output');
exit();
