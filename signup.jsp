<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/signup.css">
  </head>
  <body>
    <div class="container">
      <div class="section">
        <div class="heading-1">Sign up to our application</div>
      </div>
      <div class="section">
        <form action="controller/doSignup.jsp" method="POST">
          <div class="formItem">
                <label for="inName">Name</label>
                <input id="inName" type="text" name="inName">
          </div>
          <div class="formItem">
                <label for="inEmail">Email</label>
                <input id="inEmail" type="email" name="inEmail" placeholder="example@gmail.com">
          </div>
          <div class="formItem">
                <label for="inPass">Password</label>
                <input id="inPass" type="password" name="inPass">
          </div>
          <div class="formItem">
                <label for="inPassConf">Password Confirm</label>
                <input id="inPassConf" type="password" name="inPassConf">
          </div>
          <div class="formItem">
                <label>Gender</label>
                <label class="gender">
                  <input type="radio" name="inGender" value="Male">Male
                </label>
                <label class="gender">
                  <input type="radio" name="inGender" value="Female">Female
                </label>
          </div>
          <div class="formItem">
                <input id="inSubmit" type="submit" name="inSubmit" value="Sign Up">
          </div>
          <div class="formitem">
                <%
                      String err = request.getParameter("err");
                      int errInt = (err!=null)?Integer.parseInt(err):-1;
                      
                      if(errInt > 0)
                        out.println("<div class='errMsg'>");
                      else
                        out.println("<div class='stsMsg'>"); 

                      if(errInt == 0)
                        out.println("Signup Success"); 
                      else if(errInt == 1)
                        out.println("Username must be filled");
                      else if(errInt == 2)
                        out.println("Email must be filled");
                      else if(errInt == 3)
                        out.println("Email length must be > 4 character");
                      else if(errInt == 4)
                        out.println("Email must using the correct format");
                      else if(errInt == 5)
                        out.println("Password must be filled");
                      else if(errInt == 6)
                        out.println("Password Confirm must be filled");
                      else if(errInt == 7)
                        out.println("Password and Password Confirm must be same");
                      else if(errInt == 8)
                        out.println("Gender must be choosed");
                        out.println("</div>");
                %>
          </div>
        </form>
      </div>
      <div class="section">Already have an account yet? <a href="signin.jsp">Sign in now.</a>
      </div>
      <div class="section"><%@ include file="_footer.jsp"%>
      </div>
    </div>
  </body>
</html>