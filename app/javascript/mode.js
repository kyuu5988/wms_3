function mode(){
  console.log('mode.js発動中');//動作ck用
  const modeBtn = document.getElementById("mode-btn");

  modeBtn.addEventListener("click", (e) => {
    console.log('mode変更発動');
    e.preventDefault();//送信キャンセル

    const modeNow = document.getElementById("mode-now");
    const formData = new FormData(document.getElementById("mode"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", '/mode', true );
    XHR.responseType = "json";
    XHR.send(formData);

    XHR.onload = () => {
      //レスポンスエラー用
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        alert(`サーバー側でエラーが発生しました。管理者に連絡してください`)
        return null; 
      }

      const userMode = XHR.response.mode;
      modeNow.innerHTML = userMode.mode
      window.location.reload();
      }
  });

}
window.addEventListener("turbolinks:load",mode);