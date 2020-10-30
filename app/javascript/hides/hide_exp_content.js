function hide_exp_content(){
  console.log('hide_exp_content作動');

  const exBo = document.getElementById("exp-board")
  const exCo = document.getElementById("exp-content")

  exBo.addEventListener('click',function(){
    if (exCo.getAttribute("style") == "display:block;"){
      exCo.removeAttribute("style", "display:block;");
    } else {
      exCo.setAttribute("style", "display:block;");
    }
  })
}

window.addEventListener("turbolinks:load",hide_exp_content);