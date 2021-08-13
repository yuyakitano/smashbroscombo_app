document.addEventListener('turbolinks:load', function() {
  const checknone = $("input[type=checkbox]"); 
  checknone.hide();
  //const label1 = Array.from(querySelectorAll("label")).filter((a) => a.getAttribute("for") == "combo_command_ids_")
  //debugger

  //idが#btnJs内の、チェックボックスに何か変化があれば発火
  $("#btnJs").on("keyup change", function(e){
    //チェックボックスの中でチェックが入っているHTML要素のみ取得
    const btn = document.querySelectorAll("input[type=checkbox]:checked"); 
    //btn変数内のvalueを？？？
    for(const checked_data of btn) {
      const pushcommand = checked_data.value.split(",")
      //debugger
      const hiddenbefore = document.getElementById("hidden1")
      //debugger
      const hiddenbeforesplit = hiddenbefore.value.split();
      //debugger
      hiddenbeforesplit.push(pushcommand);
      //debugger
      hiddenbefore.value = hiddenbeforesplit    
      const aaa = document.getElementById("hidden1")
      //debugger
      //new画面へのコマンド表示用
      const target = document.querySelector('#target')
      const pushcommand2 = checked_data.id
      const labelname = Array.from(checked_data.parentElement.querySelectorAll("label")).filter((a) => a.getAttribute("for") == pushcommand2 )[0].innerHTML
      
      const span = document.createElement("span");
        span.textContent = labelname;
        span.classList.add("btn");
        span.classList.add("btn-secondary");
        span.classList.add("border");
        span.classList.add("border-dark");
        
        /* p.append(value); ⇨これだとエラー「何も要素がない配列を表示しようとしている。」*/
        /* span要素を生成して、１コマンドずつspanタグを挿入する */
        target.append(span);
        
    }      
    $("input:checkbox").prop("checked", false);
    //Array.from(checked_data.parentElement.querySelectorAll("label")).filter((a) => a.getAttribute("for") == "combo_command_ids_127" )[0].innerHTML

  })
  
})