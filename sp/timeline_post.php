<?php
ini_set("display_errors", On);
error_reporting(E_ALL);

mb_language("uni");
mb_internal_encoding("utf-8");
mb_http_input("auto");
mb_http_output("utf-8");

require "constant.php";


$sql = "SELECT id, user_id, company_id, category_id, comment, created_at FROM contribution ORDER BY created_at";
//$sql = "SELECT id, user_id, company_id, category_id, comment, created_at FROM contribution ORDER BY created_at DESC LIMIT 20";

$link = new mysqli("localhost", "$db_id", "$db_pwd", "$db_name");

if(mysqli_connect_errno()) {
  printf("connect failed: %s\n", $link->connect_error());
  exit();
}

$user= array();
if($result = mysqli_query($link, $sql)){
  while ($row = mysqli_fetch_object($result)){
    $user[] = array(
    'id' => $row->id
    ,'user_id'=> $row->user_id
    ,'company_id'=> $row->company_id
    ,'category_id' => $row->category_id
    ,'comment' => $row->comment
    ,'created_at' => $row->created_at
    );
  }
  mysqli_free_result($result);
}
header('Content-type: application/json');
echo json_encode($user);

mysqli_close($link);

?>
