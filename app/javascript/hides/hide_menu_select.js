function hide_menu_select(){
  console.log('hide_menu_select作動');

  const expMenu1 = document.getElementById("exp-menu1")
  const expMenu2 = document.getElementById("exp-menu2")
  const expMenu3 = document.getElementById("exp-menu3")
  const expMenu4 = document.getElementById("exp-menu4")
  const expMenu5 = document.getElementById("exp-menu5")
  const expMenu6 = document.getElementById("exp-menu6")

  const insideMenu1 = document.getElementById("inside-menu1")
  const insideMenu2 = document.getElementById("inside-menu2")
  const insideMenu3 = document.getElementById("inside-menu3")
  const insideMenu4 = document.getElementById("inside-menu4")
  const insideMenu5 = document.getElementById("inside-menu5")
  const insideMenu6 = document.getElementById("inside-menu6")


    expMenu1.addEventListener('click',function(){
      console.log('Menu1 open');
      insideMenu1.setAttribute("style", "display:block;");
      insideMenu2.removeAttribute("style", "display:block;");
      insideMenu3.removeAttribute("style", "display:block;");
      insideMenu4.removeAttribute("style", "display:block;");
      insideMenu5.removeAttribute("style", "display:block;");
      insideMenu6.removeAttribute("style", "display:block;");
      insideMenu7.removeAttribute("style", "display:block;");

    });

    expMenu2.addEventListener('click',function(){
      console.log('Menu2 open');
      insideMenu2.setAttribute("style", "display:block;");
      insideMenu1.removeAttribute("style", "display:block;");
      insideMenu3.removeAttribute("style", "display:block;");
      insideMenu4.removeAttribute("style", "display:block;");
      insideMenu5.removeAttribute("style", "display:block;");
      insideMenu6.removeAttribute("style", "display:block;");
      insideMenu7.removeAttribute("style", "display:block;");
    });  

    expMenu3.addEventListener('click',function(){
      console.log('Menu3 open');
      insideMenu3.setAttribute("style", "display:block;");
      insideMenu1.removeAttribute("style", "display:block;");
      insideMenu2.removeAttribute("style", "display:block;");
      insideMenu4.removeAttribute("style", "display:block;");
      insideMenu5.removeAttribute("style", "display:block;");
      insideMenu6.removeAttribute("style", "display:block;");
      insideMenu7.removeAttribute("style", "display:block;");
    });

    expMenu4.addEventListener('click',function(){
      console.log('Menu3 open');
      insideMenu4.setAttribute("style", "display:block;");
      insideMenu1.removeAttribute("style", "display:block;");
      insideMenu2.removeAttribute("style", "display:block;");
      insideMenu3.removeAttribute("style", "display:block;");
      insideMenu5.removeAttribute("style", "display:block;");
      insideMenu6.removeAttribute("style", "display:block;");
      insideMenu7.removeAttribute("style", "display:block;");
    });

    expMenu5.addEventListener('click',function(){
      console.log('Menu3 open');
      insideMenu5.setAttribute("style", "display:block;");
      insideMenu1.removeAttribute("style", "display:block;");
      insideMenu2.removeAttribute("style", "display:block;");
      insideMenu3.removeAttribute("style", "display:block;");
      insideMenu4.removeAttribute("style", "display:block;");
      insideMenu6.removeAttribute("style", "display:block;");
      insideMenu7.removeAttribute("style", "display:block;");
    });

}

window.addEventListener("turbolinks:load",hide_menu_select);