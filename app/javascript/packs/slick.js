document.addEventListener("turbolinks:load"
, function () {

  $('.thumbnail').slick({
    autoplay: true, //自動再生
    arrows: false, //矢印非表示
    fade: true, //フェードの有効化
    speed: 1000, //切り替えのスピード（小さくすると速くなる）
    draggable: false, //ドラッグ操作の無効化
    asNavFor:'.thumbnail-thumb',
  });
  $('.thumbnail-thumb').slick({
    slidesToShow: 4, //表示するスライドの数
    focusOnSelect: true, //フォーカスの有効化
    asNavFor: '.thumbnail', //thumbnailクラスのナビゲーション
    arrows: false, //矢印を非表示
  });
   // コース画像モーダル表示イベント
  $(".course-item img").click(function () {
    // まず、クリックした画像の HTML(<img>タグ全体)を#frayDisplay内にコピー
    $("#grayDisplay").html($(this).prop("outerHTML"));
    //そして、fadeInで表示する。
    $("#grayDisplay").fadeIn(200);
    return false;
  });

  // コース画像モーダル非表示イベント
  // モーダル画像背景 または 拡大画像そのものをクリックで発火
  $("#grayDisplay").click(function () {
    // 非表示にする
    $("#grayDisplay").fadeOut(200);
    return false;
  });


});