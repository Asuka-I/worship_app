document.addEventListener('turbolinks:load', function () {
  $('.thumbnail').slick({
    autoplay: true, //自動再生
    arrows: false, //矢印非表示
    fade: true, //フェードの有効化
    speed: 1000, //切り替えのスピード（小さくすると速くなる）
    draggable: false, //ドラッグ操作の無効化
    asNavFor: '.thumbnail-thumb',
  });
  $('.thumbnail-thumb').slick({
    slidesToShow: 4, //表示するスライドの数
    focusOnSelect: true, //フォーカスの有効化
    asNavFor: '.thumbnail', //thumbnailクラスのナビゲーション
    arrows: false, //矢印を非表示
  });
});
