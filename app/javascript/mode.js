function mode(){
  const modeBtn = document.getElementById("mode-btn");

  //毎秒読み込み重複動作防止（有効か確かではない
  if (modeBtn.getAttribute("load") != null ){
    return null;
  }
  modeBtn.setAttribute("load","true");
  //ここまで

  modeBtn.addEventListener("click", (e) => {
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

      modeNow.innerHTML = userMode.mode
    
    //↓重複防止だが有効ではない模様
    e.preventDefault();



    }
  });

}
setInterval(mode, 2000);
//window.addEventListener("load",mode);