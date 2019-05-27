<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/signin.css">
  </head>
  <body>
    <%
          Cookie [] cookies = request.getCookies();
          String name = "";
          for(int i=0; i<cookies.length; i++){
            if(cookies[i].getName().equals("name")){
              name = (String) cookies[i].getValue();
              break;
            }
          }
          if(!name.equals(""))
            response.sendRedirect("index.jsp");
    %>
    <div class="container">
      <div class="section">
        <div class="heading-1">Sign in to our application</div>
      </div>
      <div class="section">
        <form action="controller/doSignin.jsp" method="POST">
          <div class="formItem">
                <label for="inEmail">Email</label>
                <input id="inEmail" type="email" name="inEmail" placeholder="example@gmail.com">
          </div>
          <div class="formItem">
                <label for="inPass">Password</label>
                <input id="inPass" type="password" name="inPass">
          </div>
          <div class="formItem">
            <label>
                  <input id="inCheckBox" type="checkbox" name="inCheckBox">Remember Me
            </label>
          </div>
          <div class="formItem">
                <input id="inSubmit" type="submit" name="inSubmit" value="Sign In">
          </div>
          <div class="formItem">
              <%
                      String err = request.getParameter("err");
                      int errInt = (err!=null)?Integer.parseInt(err):-1;
                      
                      if(errInt > 0)
                        out.println("<div class='errMsg'>");
                      else
                        out.println("<div class='stsMsg'>"); 
           
                      if(errInt == 1)
                        out.println("Email must be filled");
                      else if(errInt == 2)
                        out.println("Email length must be > 4 character");
                      else if(errInt == 3)
                        out.println("Email must using the correct format");
                      else if(errInt == 4)
                        out.println("Password must be filled");
                      else if(errInt == 5)
                        out.println("Incorrect Email or Password");
                        out.println("</div>");
                %>
          </div>
        </form>
      </div>
      <div class="section">Don't have an account yet? <a href="signup.jsp">Sign up now.</a>
      </div>
      <div class="section"><%@ include file="_footer.jsp"%>
      </div>
    </div>
  </body>
</html>