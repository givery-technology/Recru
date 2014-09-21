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

    <article class="posts">
      <form id="setting" action="index.html" method="post">
        <h3>アカウント設定</h3>
        <table>
          <tr>
            <th>名前</th>
            <td><label for=""><input type="text" name="user_name" placeholder="名前"></label></td>
          </tr>
          <tr>
            <th>大学</th>
            <td><label for=""><input type="text" name="school_name" placeholder="学校名"></label></td>
          </tr>
          <tr>
            <th>卒業年度</th>
            <td>
              <select id="" name="">
                <? for ($i = 2000; $i < 2020; $i++): ?>
                  <option val="<?= $i ?>"><?= $i ?></option>
                <? endfor; ?>
              </select>
            </td>
          </tr>
          <tr>
            <th>プロフィール画像</th>
            <td><div id="userIcon"><img src="img/masaki.jpg" alt="" /></div></td>
          </tr>
        </table>

        <div class="send"><input type="submit" name="send" value="保存する"></div>

      </form>

    </article>

  </section>

<? require_once 'footer.php'; ?>
