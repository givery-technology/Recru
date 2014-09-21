<? require_once "header.php"; ?>

<?
  //?user_id=ほげほげ　で指定する！
  if(isset($_GET['user_id'])){
    $usr_id = $_GET['user_id'];
  }
  require_once "user_detail_post.php";
  $json = json_decode($json);
  $count = json_decode($count);
  $json_cont = json_decode($json_cont);
?>
  <section id="wrapper">
    <article id="userDetail">
      <? foreach($json as $j):
        foreach($count as $c): ?>
      <header>
        <h2><?= $j->name; ?></h2>
        <div id="userIcon"><img src="<?= $j->img; ?>" alt="user_icon" /></div>
        <div id="userInfo">
          <div id="school"><?= $j->univ; ?> 16卒</div>
          <div id="postCount">投稿数 : <?= $c->count; ?></div>
        </div>
      </header>
      <?
        endforeach;
        endforeach;
      ?>
    </article>
    <section id="userPosts">
      <h2>最近の投稿</h2>

      <? foreach($json_cont as $cont): ?>
      <article class="posts">
        <div class="companyName"><a href="company_detail.php?id=<?= $cont->company; ?>"><?= $cont->name; ?></a></div>
        <p><?= $cont->comment; ?></p>
        <section class="commentArea">
          <ul>
            <li><a href="post_detail.php?id=<?= $cont->id; ?>">コメントする</a></li>
            <li><a href="post_detail.php?id=<?= $cont->id; ?>">詳細</a></li>
          </ul>
        </section>
      </article>
      <? endforeach; ?>

    </section>
  </section>

<? require_once "footer.php"; ?>
