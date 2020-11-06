function hide_menu_select(){
  console.log('hide_menu_select作動');

  const expMenu1 = document.getElementById("exp-menu1")
  const expMenu2 = document.getElementById("exp-menu2")
  const insideMenu1 = document.getElementById("inside-menu1")
  const insideMenu2 = document.getElementById("inside-menu2")


    expMenu1.addEventListener('click',function(){
      console.log('Menu1 open');
      insideMenu1.setAttribute("style", "display:block;");
    });

    expMenu2.addEventListener('click',function(){
      console.log('Menu2 open');
      insideMenu2.setAttribute("style", "display:block;");
    });  

}

window.addEventListener("turbolinks:load",hide_menu_select);