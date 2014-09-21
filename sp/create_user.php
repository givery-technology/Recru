<?php
ini_set("display_errors", On);
error_reporting(E_ALL);

mb_language("uni");
mb_internal_encoding("utf-8");
mb_http_input("auto");
mb_http_output("utf-8");

require 'facebook-php-sdk/src/facebook.php';
require 'constant.php';




$uid = $_POST['uid'];
$name = $_POST['name'];
$img = "http://graph.facebook.com/".$uid."/picture?type=normal";
$univ = "";
$grad_year = 2014;


$link = new mysqli("localhost", "$db_usr", "$db_pwd", "$db_name");

if (!mysqli_set_charset($link, "utf8")) {
      printf("Error loading character set utf8: %s\n", mysqli_error($link));
} else {
      //printf("Current character set: %s\n", mysqli_character_set_name($link));
}

$sql = "SELECT id FROM user WHERE facebook_id = ".$uid;

$result = mysqli_query($link, $sql);
$user= array();

if ($result->num_rows > 0) {
while ($row = mysqli_fetch_object($result)){
    $user[] = array(
    'id' => $row->id
    );
  }
  mysqli_free_result($result);
} else {
	$sql = "INSERT INTO user (name, facebook_id, img, univ, grad_year) VALUES('$name', $uid, '$img', '$univ', $grad_year)";


	if($link->query($sql)){
  
	} else if(mysqli_connect_errno()) {
  		printf("connect failed: %s\n", $link->connect_error());
  	exit();
	}
	$sql = "SELECT id FROM user WHERE facebook_id = ".$uid;

	$result = mysqli_query($link, $sql);
	while ($row = mysqli_fetch_object($result)){
    $user[] = array(
    'id' => $row->id
    );
  }
  mysqli_free_result($result);

}


header('Content-type: application/json');
echo json_encode($user);

mysqli_close($link);
 
?>
