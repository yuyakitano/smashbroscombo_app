//初回読み込み、リロード、ページ切り替えで動くよう
//$(turbolinks:load, function () {実施するも無理だった。。。
$(function () {  
  //inputのIDから情報の取得？ 
  function readURL(input) {
    
    if (input.files && input.files[0]) {
      //ここから既存の画像の情報の取得？
      
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev').attr('src', e.target.result);
      }
      //取得したurlにアップロード画像のurlを挿入
      reader.readAsDataURL(input.files[0]);
    }
  }
  //セレクタimg_fieldに変化があった時点で
  $('.img_field').change(function () {
    //
    readURL(this);
  });
});

