function loginCheck(actionURL){
   if(document.login.id.value==""){
      alert("Enter your ID");
      document.login.id.focus();
      return;
   }
   if(document.login.pwd.value==""){
      alert("Enter your password");
      document.login.pwd.focus();
      return;
   }
   document.login.action = actionURL;
   document.login.submit();
}