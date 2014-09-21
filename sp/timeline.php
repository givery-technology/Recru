<? require_once "header.php"; ?>

<?php
  require_once "timeline_post.php";
  // $json = file_get_contents("timeline_post.php");
  $obj = json_decode($json);
?>

<section id="wrapper">
  <form id="sendPost" action="timeline_post" method="post">
    <div id="postText">
      <select name="category">
      	<option value="">企業名を選択</option>
        <option value="company1">givery Inc.</option>
        <option value="company2">company2</option>
        <option value="company3">company3</option>
      </select>
      <select name="category">
      	<option value="">場面を選択してください</option>
      	<option value="test1">test1</option>
      	<option value="test2">test2</option>
      	<option value="test3">test3</option>
      </select>
      <textarea name="postText" rows="8" cols="40" placeholder="この会社どんな感じ？"></textarea>
    </div>
    <div id="sendBtn">
      <input type="submit" name="send" value="投稿する">
    </div>
  </form>

  <section id="postTimeline">
    <? foreach($obj as $item): ?>
    <article class="posts">
      <header>
        <h2><img src="<?= $item->img; ?>" alt="userIcon" /></h2>
        <div class="userInfo">
          <h3><a href="user_detail.php?user_id=<?= $item->user_id; ?>"><?= $item->name; ?></a></h3>
          <time datetime="<?= $item->created_at; ?>"><?= $item->created_at; ?></time>
        </div>
      </header>
      <section class="postDetails">
        <div class="companyName"><a href="company_detail.php?id=<?= $item->company_id; ?>"><?= $item->company_name; ?></a></div>
        <p><?= $item->comment; ?></p>
      </section>
      <section class="commentArea">
        <ul>
          <li><a href="post_detail.php?id=<?= $item->id; ?>">コメントする</a></li>
          <li><a href="post_detail.php?id=<?= $item->id; ?>">詳細</a></li>
        </ul>
      </section>
    </article>
  <? endforeach; ?>
  </section>

</section>

<? require_once "footer.php"; ?>
