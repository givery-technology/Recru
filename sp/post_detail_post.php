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
  $cont_id = $_GET['id'];
}

$sql_cont = "SELECT contribution.id, user.img, user.name, contribution.created_at, company.name as company_name, contribution.comment FROM contribution INNER JOIN company ON contribution.company_id = company.id INNER JOIN user ON contribution.user_id = user.id WHERE contribution.id=".$cont_id;
$sql = "SELECT contribution.id, user.name, reaction.reaction, reaction.created_at FROM reaction INNER JOIN user ON reaction.user_id = user.id INNER JOIN contribution ON reaction.cont_id = contribution.id WHERE contribution.id=".$cont_id." ORDER BY created_at";
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
    'id' => $row_cont->id
    ,'img'=> $row_cont->img
    ,'name'=> $row_cont->name
    ,'company_name' => $row_cont->company_name
    ,'comment' => $row_cont->comment
    ,'created_at' => $row_cont->created_at
    );
  }
  mysqli_free_result($result_cont);
}
header('Content-type: application/json');
echo "contribution:".json_encode($user_cont);


    $user= array();
    if($result = mysqli_query($link, $sql)){
        while ($row = mysqli_fetch_object($result)){
            $user[] = array(
                            'id' => $row->id
                            ,'name'=> $row->name
                            ,'reaction'=> $row->reaction
                            ,'created_at' => $row->created_at
                            );
        }
        mysqli_free_result($result);
    }
   // header('Content-type: application/json');
    echo "reactions:".json_encode($user);
    
mysqli_close($link);

?>
