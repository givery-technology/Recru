<? require_once "header.php"; ?>

<?php
  require_once "timeline_post.php";
  // $json = file_get_contents("timeline_post.php");
  $obj = json_decode($json);
?>

<script charset="utf-8">
$(function(){
  var now = new Date();
  var year = now.getYear(); // 年
  var month = now.getMonth() + 1; // 月
  var day = now.getDate(); // 日
  var hour = now.getHours(); // 時
  var min = now.getMinutes(); // 分
  var sec = now.getSeconds(); // 秒

  if(year < 2000) { year += 1900; }

  // 数値が1桁の場合、頭に0を付けて2桁で表示する指定
  if(month < 10) { month = "0" + month; }
  if(day < 10) { day = "0" + day; }
  if(hour < 10) { hour = "0" + hour; }
  if(min < 10) { min = "0" + min; }
  if(sec < 10) { sec = "0" + sec; }

  var name    = "Takahiro Masaki";
  var img     = "img/masaki.jpg";
  var company = "givery inc";
  var now = new Date();
  var date = year + "-" + month + "-" + day + "  " + hour + ":" + min + ":" + sec;

  $("#timelineBtn").click(function(){
    var text = $("#timelineText").val();
    if (text.length > 0){
      var postText = '<article class="posts"><header><h2><img src="' + img + '" alt="userIcon" /></h2><div class="userInfo"><h3><a href="user_detail.php?user_id=2">' + name + '</a></h3><time datetime="">' + date + '</time></div></header><section class="postDetails"><div class="companyName"><a href="company_detail.php?id=1">' + company + '</a></div><p>' + text + '</p></section><section class="commentArea"><ul><li><a href="post_detail.php?id=2>">コメントする</a></li><li><a href="post_detail.php?id=2">詳細</a></li></ul></section></article>';
      $("#postTimeline").prepend(postText).hide(0).fadeIn(500);
      $("#timelineText").val("")
    }
  });


});
</script>

<section id="wrapper">
  <form id="sendPost" action="timeline_post" method="post">
    <div id="postText">
      <select name="company">
      	<option value="">企業名を選択</option>
        <option value="company">givery Inc.</option>
      </select>
      <select name="category">
      	<option value="">場面を選択してください</option>
      	<option value="test">書類選考について(sp)</option>
      </select>
      <textarea id="timelineText" name="postText" rows="8" cols="40" placeholder="この会社どんな感じ？"></textarea>
    </div>
    <div id="sendBtn">
      <a id="timelineBtn" href="javascript:void(0)">投稿する</a>
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
