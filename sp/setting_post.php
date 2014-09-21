<?php
ini_set("display_errors", On);
error_reporting(E_ALL);

mb_language("uni");
mb_internal_encoding("utf-8");
mb_http_input("auto");
mb_http_output("utf-8");

require 'facebook-php-sdk/src/facebook.php';
require 'constant.php';


$facebook = new Facebook(array(
  'appId'  => $fb_id,
  'secret' => $fb_pwd,
));

$uid = $facebook->getUser();
$user = $facebook->api('/'.$uid);
//$user = $facebook->api('/me');

$name = $user['name'];
$fb_id = $user['id'];
$img = "http://graph.facebook.com/".$user['id']."/picture?type=normal";
$univ = $_POST['school_name'];
$grad_year = $_POST['year'];


$sql = "INSERT INTO user (name, facebook_id, img, univ, grad_year) VALUES('$name', $fb_id, '$img', '$univ', $grad_year)";

$link = new mysqli("localhost", "$db_usr", "$db_pwd", "$db_name");

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
