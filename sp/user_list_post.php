<?php
ini_set("display_errors", On);
error_reporting(E_ALL);

mb_language("uni");
mb_internal_encoding("utf-8");
mb_http_input("auto");
mb_http_output("utf-8");

require "constant.php";

// $sql = "SELECT user.name, user.img, user.univ FROM user_friend INNER JOIN user ON user_friend.user_id = user.id";/* WHERE user_friend.user_id=".$usr_id*/
$sql = "SELECT * FROM user";
$link = new mysqli("localhost", "$db_usr", "$db_pwd", "$db_name");

$link->set_charset('utf8');

if(mysqli_connect_errno()) {
  printf("connect failed: %s\n", $link->connect_error());
  exit();
}

$user= array();
if($result = mysqli_query($link, $sql)){
  while ($row = mysqli_fetch_object($result)){
    $user[] = array(
       "id" => $row->id
      ,'name' => $row->name
      ,'img'=> $row->img
      ,'univ'=> $row->univ
      ,'grad' => $row->grad_year
    );
  }
  mysqli_free_result($result);
}
// header('Content-type: application/json');
$json = json_encode($user);
// echo $json;

mysqli_close($link);

?>
