<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Php55\Rector\String_\StringClassNameToClassConstantRector;
use Rector\Set\ValueObject\LevelSetList;
use Rector\Set\ValueObject\SetList;
use Rector\PHPOffice\Set\PHPOfficeSetList;
use Rector\Config\RectorConfig;

return function (RectorConfig $rectorConfig): void {
    $rectorConfig->import(PHPOfficeSetList::PHPEXCEL_TO_PHPSPREADSHEET);
};


return static function (RectorConfig $rectorConfig): void {
    $rectorConfig->sets([LevelSetList::UP_TO_PHP_81, SetList::CODE_QUALITY, SetList::DEAD_CODE, SetList::NAMING]);

    $rectorConfig->importNames();

    $rectorConfig->paths([__DIR__ . '/src', __DIR__ . '/tests']);
    $rectorConfig->skip([
        StringClassNameToClassConstantRector::class => [__DIR__ . '/config'],
    ]);

    $rectorConfig->parallel();
};
