<?php
$month = array(
  "",
  "มกราคม",
  "กุมภาพันธ์",
  "มีนาคม",
  "เมษายน",
  "พฤษภาคม",
  "มิถุนายน",
  "กรกฎาคม",
  "สิงหาคม",
  "กันยายน",
  "ตุลาคม",
  "พฤศจิกายน",
  "ธันวาคม"
);

function getThaiDate($datetimeString) {
  global $month;
  $timestamp = strtotime($datetimeString);
  $d = (int)date("d",$timestamp);
  $m = (int)date("m",$timestamp);
  $y = (int)date("Y",$timestamp);
  return $d." ".$month[$m]." พ.ศ. ".($y + 543);
}

function getThaiTime($datetimeString) {
  $timestamp = strtotime($datetimeString);
  return date("H:i",$timestamp)." น.";
}

function getThaiDateTime($datetimeString) {
  return getThaiDate($datetimeString)." ".getThaiTime($datetimeString);
}
