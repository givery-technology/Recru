<?
ini_set("display_errors", On);
error_reporting(E_ALL);

session_start();
require 'facebook-php-sdk/src/facebook.php';
require 'constant.php';

$facebook = new Facebook(array(
    'appId'  => $fb_id,
      'secret' => $fb_pwd,
    ));

$user = $facebook->getUser();
if ($user) {
  try {
    // Proceed knowing you have a logged in user who's authenticated.
  header('location:'.$timeline_url);
    $user_profile = $facebook->api('/me');
  } catch (FacebookApiException $e) {
    error_log($e);
    $user = null;
  }
}else {
  $loginUrl = $facebook->getLoginUrl(array('scope' => 'read_friendlists', 'redirect_uri' => $timeline_url));
}
?>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name=viewport content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/mobile.css">
  <title>recru</title>
</head>
<body>


<header id="indexHeader">
  <h1 id="logo">
    <a href="index.php"><img src="img/logo.png" alt="" /></a>
  </h1>
</header>

  <section id="main">
    <div id="mainVisual"><img src="img/lp/mobile_bgImage.png" alt="" /></div>
    <div id="mainContent">
      <h1 id="mainLogo"><img src="img/lp/recru_logo.png" alt="recru" /></h1>
      <h2>仲間と助け合うための就活SNS</h2>
      <a id="face" href="<?echo $loginUrl?>"><img src="img/lp/mobile_fbButton.png" alt="fb" /></a>
      <a href="#"><img src="img/lp/mobile_dlButton.png" alt="" /></a>
    </div>
  </section>


  <section id="section2">
    <h2>時代は就職氷河期</h2>
    <p>リクルーはヒヤッとした就活を<br />ちょっとだけホットにするSNS</p>
    <ul>
      <li>
        <div class="listImg"><img src="img/lp/mobile_iconBear1.png" alt="bear1" /></div>
        <h3>知り合いとだけ共有</h3>
        <p>Facebookで繋がりのある友人<br />とだけ情報の共有を行うため、<br />信用できる情報だけが集まります。</p>
      </li>
      <li>
        <div class="listImg"><img src="img/lp/mobile_iconBear2.png" alt="bear2" /></div>
        <h3>外では知り得ない<br />情報をゲット</h3>
        <p>クローズドなSNSであるため、<br />外ではなかなか共有できない<br />マル秘話が聞けるかもしれません。<br />(機密情報は守りましょう)  </p>
      </li>
      <li>
        <div class="listImg"><img src="img/lp/mobile_iconBear3.png" alt="bear3" /></div>
        <h3>広告は一切無し、<br />お金も必要なし</h3>
        <p>リクルーでは広告表示もなければ、<br />白熊に対価を払う必要もありません。<br />ご安心してご利用ください。</p>
      </li>
    </ul>
  </section>

  <section id="section3">
    <div id="left">
      <h3><img src="img/lp/mobile_iconBear4.png" alt="recru" />スマホアプリ対応</h3>
      <p>
        リクルーはWEBプラットフォームだけでなく、モバイルアプリも標準実装しています。<br />
        ESを書いている最中に行き詰まったとき、面接が終わった時、
        スマートフォンを握りしめて選考結果のメールを待ちわびている時。<br />
        いつでもどこでもアプリを起動して情報を共有、収集することが可能です。
      </p>
      <a href="#"><img src="img/lp/mobile_dlButton.png" alt="" /></a>
    </div>
    <div id="right">
      <img src="img/lp/mobile_smartphone.png" alt="sp" />
    </div>
  </section>

  <section id="section4">
    <h3>さっそくサービスを<br />体験してみましょう</h3>
    <img src="img/lp/mobile_textBottom.png" alt="text" />
  </section>

  <section id="section5">
    <img src="img/lp/mobile_imageBottom.png" alt="kuma" />
    <a href="<?echo $loginUrl?>"><img src="img/lp/mobile_fbButton.png" alt="fb" /></a>
  </section>




<? require_once "footer.php"; ?>
