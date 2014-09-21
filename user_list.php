<? require_once 'header.php'; ?>

  <aside id="timelineSide">
    <div class="sideList">
      <h4>新着の企業</h4>
      <ul>
        <li><a href="#">株式会社ギブリー</a></li>
        <li><a href="#">株式会社ギブリー</a></li>
        <li><a href="#">株式会社ギブリー</a></li>
      </ul>
      <div class="read"><a href="#">もっと見る</a></div>
    </div>
    <div class="sideList">
      <h4>おすすめの企業</h4>
      <ul>
        <li><a href="#">株式会社ギブリー</a></li>
        <li><a href="#">株式会社ギブリー</a></li>
        <li><a href="#">株式会社ギブリー</a></li>
      </ul>
      <div class="read"><a href="#">もっと見る</a></div>
    </div>
  </aside>

  <section id="timeline">

  <? for($i = 0; $i < 11; $i++): ?>
    <article class="posts">
      <div class="userList">
        <a href="#">
          <div class="userIcon"><img src="img/masaki.jpg" alt="user" /></div>
          <div class="userInfo">
            <h3>正木貴大</h3>
            <div class="schoolName">法政大学</div>
          </div>
          <div class="userPosts">
            <h4>最近の投稿</h4>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
          </div>
        </a>
      </div>
    </article>
  <? endfor; ?>

  </section>

<? require_once 'footer.php'; ?>
