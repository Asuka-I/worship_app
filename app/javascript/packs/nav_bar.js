$(document).ready(function () {
  // HTMLドキュメントがロードされ、DOMの準備ができたときに実行

  // ブレイクポイント以上の時
  $(window).resize(function () {
    if ($(window).width() >= 980) {
      // マウスホバーした時にドロップダウンが開く
      $('.navbar .dropdown-toggle').hover(function () {
        $(this).parent().toggleClass('show');
        $(this).parent().find('.dropdown-menu').toggleClass('show');
      });

      // カーソルが離れた時にドロップダウンを隠す
      $('.navbar .dropdown-menu').mouseleave(function () {
        $(this).removeClass('show');
      });
    }
  });
});
