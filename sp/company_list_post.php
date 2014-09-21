<?php
ini_set("display_errors", On);
error_reporting(E_ALL);

mb_language("uni");
mb_internal_encoding("utf-8");
mb_http_input("auto");
mb_http_output("utf-8");
require 'constant.php';



$sql = "SELECT company.name as company_name, company.url, industry_type.name as industry_name, company.img FROM company INNER JOIN industry_type ON company.industry_id = industry_type.id";

$link = new mysqli("localhost", "$db_usr", "$db_pwd", "$db_name");

if(mysqli_connect_errno()) {
  printf("connect failed: %s\n", $link->connect_error());
  exit();
}

$user= array();
if($result = mysqli_query($link, $sql)){
  while ($row = mysqli_fetch_object($result)){
    $user[] = array(
    'name' => $row->company_name
    ,'url'=> $row->url
    ,'industry_type'=> $row->industry_name
    ,'img' => $row->img
    );
  }
  mysqli_free_result($result);
}
header('Content-type: application/json');
echo json_encode($user);

mysqli_close($link);

?>
