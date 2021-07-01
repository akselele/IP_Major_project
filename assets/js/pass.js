let pw1 = document.getElementById("user_password");
let pw2 = document.getElementById("password2");
let button = document.getElementById("buttonId");
let match = document.getElementById("match");


function language(){
  let x = getCookie("locale");
  if(x == "nl"){
    return "Wachtwoorden matchen niet!"
  }
  else if(x == "en"){
    return "Passwords do not match!";
  }
  else{
    return "パスワードが一致していません！";
  }
  
}


button.disabled = true;
function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}


document.addEventListener("change", ev => {
  if (pw2.value == pw1.value && pw1.value != "") {
    button.disabled = false;
    match.innerHTML = "";
  }
  else {
    button.disabled = true;
    match.innerHTML = language();
  }
})

