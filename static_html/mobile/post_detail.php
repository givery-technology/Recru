<? require_once "header.php"; ?>

  <section id="wrapper">
    <article id="detailPosts">
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
        <form id="commentForm" action="index.html" method="post">
          <input type="text" name="comment" placeholder="コメントを入力" /><input type="submit" name="sendComment" value="送信" />
        </form>

        <? for ($i = 0; $i < 8; $i++): ?>
        <article class="comments">
          <div class="commentUserIcon">
            <img src="img/masaki.jpg" alt="userIcon" />
          </div>
          <div class="comment">
            <h4><a href="#">正木 貴大</a></h4>
            <div>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </div>
          </div>
        </article>
        <? endfor; ?>
      </section>
  </section>

<? require_once "footer.php"; ?>
