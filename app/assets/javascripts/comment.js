 
$(document).on('turbolinks:load', ()=> {
  
  // 追加するビューを定義。先ほど書いたビューのeach以下と同じです。
  function buildHTML(comment){
    debugger
    let html =
    `<div class='combo__topContent__commentBox__index__box'>
      <span class='combo__topContent__commentBox__index__box--username'>${comment.user_username}</span>
      <span class='combo__topContent__commentBox__index__box--date'>${comment.created_at}</span>
      <p class='combo__topContent__commentBox__index__box--content'>${comment.content}</p>
    </div>`
    debugger
    return html;    
  }
  // データが送信された時の処理
  
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    //binding.pry
    // 送るデータとオプションを指定
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    
    // 通信が成功した時
    .done(function(data){
      // 上で定義したHTML
      //debugger
      let html = buildHTML(data);
      // html要素を追加する
      $('.combo__topContent__commentBox__index').append(html);
      //debugger
      // フォームの中身をからにする
      $('.combo__topContent__commentBox__content').val('');
      // 追加した要素の分だけスクロールさせる
      //debugger
      $('.combo__topContent__commentBox__index').animate({ scrollTop: $('.combo__topContent__commentBox__index')[0].scrollHeight});
      // 送信ボタンが一度押したら再度押せなくなる処理を無効にして、連続投稿可能にする。
      $('.combo__topContent__commentBox__submit').prop('disabled', false);
      $('.combo__topContent__commentBox__submit').removeAttr('data-disable-with');
    })
    // 通信に失敗した時
    .fail(function(){
      alert('コメントを入力してください。。');
    })
  })
})