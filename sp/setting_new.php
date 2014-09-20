<? require_once "header.php"; ?>

  <section id="wrapper">
    <article id="setting_new">
      <h2>アカウント設定</h2>
      <form action="#" method="post">
        <div>名前</div>
        <input type="text" name="user_name" placeholder="名前">
        <div>学校名</div>
        <input type="text" name="school_name" placeholder="学校名">
        <div>卒業年度</div>
        <select name="year">
          <? for ($i = 2000; $i <= 2018; $i++): ?>
          <option value="<?= $i; ?>"><?= $i; ?>年</option>
          <? endfor; ?>
        </select>
        <div>ユーザーアイコン</div>
        <div id="userIcon"><img src="img/masaki.jpg" alt="userIcon" /></div>
        <input type="submit" name="send_setting" value="登録する">
      </form>
    </article>
  </section>

<? require_once "footer.php"; ?>
