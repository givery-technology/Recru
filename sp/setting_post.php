<?php
ini_set("display_errors", On);
error_reporting(E_ALL);

mb_language("uni");
mb_internal_encoding("utf-8");
mb_http_input("auto");
mb_http_output("utf-8");

require "constant.php";

$name = $_POST['user_name'];
//$fb_id = $_POST['facebook_id'];
//$img = $_POST['img'];
$univ = $_POST['school_name'];
$grad_year = $_POST['year'];


//$sql = "INSERT INTO user (name, facebook_id, img, univ, grad_year) VALUES('$name', $fb_id, '$img', '$univ', $grad_year)";
$sql = "INSERT INTO user (name,  univ, grad_year) VALUES('$name',  '$univ', $grad_year)";

$link = new mysqli("localhost", "$db_id", "$db_pwd", "$db_name");

if (!mysqli_set_charset($link, "utf8")) {
      printf("Error loading character set utf8: %s\n", mysqli_error($link));
} else {
      printf("Current character set: %s\n", mysqli_character_set_name($link));
}

if($link->query($sql)){
  
} else if(mysqli_connect_errno()) {
  printf("connect failed: %s\n", $link->connect_error());
  exit();
}

mysqli_close($link);
?>
