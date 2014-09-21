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
  <title>サービスタイトル</title>
</head>
<body>
<div id="wrapperImg">
  <img src="img/mobile-top.png" alt="top" />
</div>

<header id="indexLogo">
  <h1>logo</h1>
</header>

<div id="indexWrapper">
  <section id="fbLogin">
  <a href="<?echo $loginUrl?>">Facebook で始める</a>
  </section>
</div>



<? require_once "footer.php"; ?>
