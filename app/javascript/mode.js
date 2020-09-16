function mode(){
  const modeBtn = document.getElementById("mode-btn");

  modeBtn.addEventListener("click",function(){
    const modeNow = document.getElementById("mode-now");
    const formData = new FormData(document.getElementById("mode"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", '/mode', true );
    XHR.responseType = "json";
    XHR.send(formData);

    XHR.onload = () => {
      //↓レスポンスがエラーだった時の処理の記述
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        alert(`サーバー側でエラーが発生しました。管理者に連絡してください`)
        return null;  //この返り値の設定でエラー時にjsの処理を停止する
      }

      const userMode = XHR.response.mode;

      modeNow.innerHTML = "aaaa"


    }
  });

}

window.addEventListener("load",mode);