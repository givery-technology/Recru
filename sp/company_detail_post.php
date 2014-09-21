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
  $comp_id = $_GET['id'];
}

$sql_cont = "SELECT company.name, company.img, industry_type.name as industry_name, company.url FROM company INNER JOIN industry_type ON company.industry_id = industry_type.id WHERE company.id=".$comp_id;
$sql = "SELECT user.name, user.img, contribution.created_at, contribution.comment FROM contribution INNER JOIN user ON contribution.user_id = user.id WHERE contribution.company_id=".$comp_id." ORDER BY created_at";
$link = new mysqli("localhost", "$db_usr", "$db_pwd", "$db_name");

$link->set_charset('utf8');

if(mysqli_connect_errno()) {
  printf("connect failed: %s\n", $link->connect_error());
  exit();
}

$user_cont= array();
if($result_cont = mysqli_query($link, $sql_cont)){
  while ($row_cont = mysqli_fetch_object($result_cont)){
    $user_cont[] = array(
    'name' => $row_cont->name
    ,'img' => $row_cont->img
    ,'industry_name' => $row_cont->industry_name
    );
  }
  mysqli_free_result($result_cont);
}
header('Content-type: application/json');
echo "company_info:".json_encode($user_cont);


$user= array();
if($result = mysqli_query($link, $sql)){
  while ($row = mysqli_fetch_object($result)){
    $user[] = array(
      'name' => $row->name
      ,'img'=> $row->img
      ,'created_at'=> $row->created_at
      ,'comment'=> $row->comment
    );
  }
  mysqli_free_result($result);
}
// header('Content-type: application/json');
echo "contributions:".json_encode($user);

mysqli_close($link);

?>
