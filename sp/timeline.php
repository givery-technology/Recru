<? require_once "header.php"; ?>

<section id="wrapper">
  <form id="sendPost" action="index.html" method="post">
    <div id="postText">
      <input type="text" name="company" size="60" placeholder="企業名"></textarea>
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
    <? for($i = 0; $i < 10; $i++): ?>
    <article class="posts">
      <header>
        <h2><img src="img/masaki.jpg" alt="userIcon" /></h2>
        <div class="userInfo">
          <h3><a href="#">正木 貴大</a></h3>
          <time datetime="yyyy-mm-dd">yyyy/mm/dd</time>
        </div>
      </header>
      <section class="postDetails">
        <div class="companyName"><a href="#">株式会社ギブリー</a></div>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </section>
      <section class="commentArea">
        <ul>
          <li><a href="#">コメントする</a></li>
          <li><a href="#">詳細</a></li>
        </ul>
      </section>
    </article>
    <? endfor; ?>
  </section>

</section>

<? require_once "footer.php"; ?>
