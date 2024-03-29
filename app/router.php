<?php

if (preg_match('/\.(?:png|jpg|jpeg|gif)$/', $_SERVER["REQUEST_URI"])) {
    return false;    // serve the requested resource as-is.
}

/**
* PHP Built-in Web Server wrapper for ZF apps
*/

$reqUri = $_SERVER['REQUEST_URI'];
if (strpos($reqUri, '?') !== false) {
$reqUri = substr($reqUri, 0, strpos($reqUri, '?'));
}

$target = realpath(__DIR__ . $reqUri);
if ($target && is_file($target)) {
// Security check: make sure the file is under the public dir
if (strpos($target, __DIR__) === 0) {
// Tell PHP to directly serve the requested file
return false;
}
}

// Load the ZF app front controller script
require __DIR__ . '/index.php';
?>