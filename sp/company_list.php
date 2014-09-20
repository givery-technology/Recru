<? require_once "header.php"; ?>

<section id="wrapper">
  <section id="companys">
    <h2>企業一覧</h2>
    <ul id="companyList">
      <? for ($i = 0;$i < 11; $i++): ?>
      <li>
        <a href="#">
          <div id="companyIcon"><img src="img/givery_logo.png" alt="" /></div>
          <div id="companyInfo">
            <h3>株式会社ギブリー</h3>
            <div id="category">業種：<span class="categoryName">IT</span></div>
          </div>
        </a>
      </li>
      <? endfor; ?>
    </ul>
  </section>
</section>

<? require_once "footer.php"; ?>
