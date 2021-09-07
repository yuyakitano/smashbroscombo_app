if (window.matchMedia( "(min-width: 1350px)" ).matches) {
  /* ウィンドウサイズが 1350px以下の場合に有効にしたい処理*/

  $(function() {
    $('.slide').each(function() {
      // スライド（画像）の数を取得
      var $slides = $(this).find('img'),
          slideNum = $slides.length,
          currentIdx = 0; // 何番目か
      // debugger
      // 最初の画像をフェードイン
      $(".slide img").eq(currentIdx).fadeIn();
      // debugger
      // 3秒後に次のスライドを表示
      setTimeout(dispNextSlide, 4000);
      // debugger
      // 次のスライドを表示するメソッド
      function dispNextSlide() {
        var nextIdx = currentIdx + 1;
        // debugger
        // 最後のスライドの場合ははじめに戻る
        if (nextIdx > (slideNum - 1)) {
          // debugger
          nextIdx = 0
        };
        // debugger
        // 現在のスライドをフェードアウト
        $(".slide img").eq(currentIdx).fadeOut();
        // debugger
        // 次のスライドをフェードイン
        $(".slide img").eq(nextIdx).fadeIn();
        // debugger
        // インデックスを更新
        currentIdx = nextIdx;
        // debugger
        setTimeout(dispNextSlide, 4000);
      }
    });
  });
}