<?php
ini_set("display_errors", On);
error_reporting(E_ALL);

mb_language("uni");
mb_internal_encoding("utf-8");
mb_http_input("auto");
mb_http_output("utf-8");

require "constant.php";

//?id=ほげほげ　で指定する！
if(isset($_GET['id'])){
  $usr_id = $_GET['id'];
}

$sql = "SELECT name, univ, grad_year, img FROM user WHERE id=".$usr_id;
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
      'name' => $row->name
      ,'univ'=> $row->univ
      ,'grad_year'=> $row->grad_year
      ,'img'=> $row->img
    );
  }
  mysqli_free_result($result);
}
// header('Content-type: application/json');
echo json_encode($user);

mysqli_close($link);

?>
