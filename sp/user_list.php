<? require_once "header.php"; ?>

<section id="wrapper">
  <section id="userList">
    <h2>友達一覧</h2>
    <ul id="friendList">
      <? for ($i = 0;$i < 11; $i++): ?>
      <li>
        <a href="#">
          <div id="userIcon"><img src="img/masaki.jpg" alt="" /></div>
          <div id="userInfo">
            <h3>正木 貴大</h3>
            <div id="school">法政大学 情報科学部</div>
          </div>
        </a>
      </li>
      <? endfor; ?>
    </ul>
  </section>
</section>

<? require_once "footer.php"; ?>
