<? require_once "header.php"; ?>
<?
  // //?id=ほげほげ　で指定する！
  // if(isset($_GET['id'])){
  //   $usr_id = $_GET['id'];
  // }
  require_once "user_list_post.php";
  $json = json_decode($json);

?>

<section id="wrapper">
  <section id="userList">
    <h2>友達一覧</h2>
    <ul id="friendList">
      <? foreach($json as $j): ?>
      <li>
        <a href="#">
          <div id="userIcon"><img src="<?= $j->img; ?>" alt="icon" /></div>
          <div id="userInfo">
            <h3><?= $j->name; ?></h3>
            <div id="school"><?= $j->univ; ?></div>
          </div>
        </a>
      </li>
      <? endforeach; ?>
    </ul>
  </section>
</section>

<? require_once "footer.php"; ?>
