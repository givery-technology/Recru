<?php
ini_set("display_errors", On);
error_reporting(E_ALL);

mb_language("uni");
mb_internal_encoding("utf-8");
mb_http_input("auto");
mb_http_output("utf-8");

require "constant.php";


$sql_cont = "SELECT name, img, univ FROM user WHERE id=".$usr_id;
$sql = "SELECT contribution.id, company.name, contribution.comment, company.id as company_id FROM contribution INNER JOIN company ON contribution.company_id = company.id WHERE user_id=".$usr_id." ORDER BY created_at";
$postCount = "SELECT count(*) as count FROM contribution WHERE user_id = ".$usr_id;
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
    ,'univ' => $row_cont->univ
    );
  }
  mysqli_free_result($result_cont);
}
$count = array();
if($result_post = mysqli_query($link, $postCount)){
  while ($row_post = mysqli_fetch_object($result_post)){
    $count[] = array(
    'count' => $row_post->count
    );
  }
  mysqli_free_result($result_post);
}
// header('Content-type: application/json');
$json = json_encode($user_cont);
$count = json_encode($count);


    $user= array();
    if($result = mysqli_query($link, $sql)){
        while ($row = mysqli_fetch_object($result)){
            $user[] = array(
                             'id' => $row->id
                            ,'company' => $row->company_id
                            ,'name' => $row->name
                            ,'comment'=> $row->comment
                            );
        }
        mysqli_free_result($result);
    }
   // header('Content-type: application/json');
  $json_cont = json_encode($user);

mysqli_close($link);

?>
