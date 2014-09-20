<? require_once 'header.php'; ?>

  <section id="timeline">
    <div id="postForm">
      <form action="index.html" method="post">
        <div id="postInfo">
          <input type="text" name="companyName" placeholder="企業名">
          <select id="situationName" name="situation">
            <option val="1">面接時</option>
            <option val="1">面接時</option>
            <option val="1">面接時</option>
          </select>
        </div>
        <textarea placeholder="どうでしたか？"></textarea>
        <input type="submit" name="sendPost" value="投稿する">
      </form>
    </div>
    <article class="posts"></article>
  </section>

<? require_once 'footer.php'; ?>
