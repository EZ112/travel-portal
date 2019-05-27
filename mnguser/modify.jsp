<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="../assets/css/insertuser.css">
  </head>
  <body>
    <%@ include file = "../controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");

          String userId = request.getParameter("userId");

          String fullname = "";
          String email = "";
          String gender = "";
          String pass = "";
          String modifyType = (userId != null)?"Update":"Insert";
       
          String query = "SELECT * FROM users_tbl where userId = " +userId;
          ResultSet rs = st.executeQuery(query);

          while(rs.next()){
            fullname = rs.getString(2);
            email = rs.getString(3);
            pass = rs.getString(4);
            gender = rs.getString(5);
          } 
    %>
    <% String heading = (userId != null)?"Update User":"Insert User";%>
    <% String tagline = (userId != null)?"Update active user":"Insert new user";%>
    <div class="container">
      <div class="section"><%@ include file="../_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="../_header.jsp"%>
      </div>
      <div class="section">
        <form action="./controller/modifyUser.jsp" method="POST">
          <input type="hidden" name="modifyType" value='<%= modifyType%>'>
          <input type="hidden" name="userId" value='<%= userId%>'>
          <div class="formItem">
                <label for="inName">Name</label>
                <input id="inName" type="text" name="inName" value='<%= fullname%>'>
          </div>
          <div class="formItem">
                <label for="inEmail">Email</label>
                <input id="inEmail" type="email" name="inEmail" placeholder="example@gmail.com" value='<%= email %>'>
          </div>
          <div class="formItem">
                <label>Gender</label>
                <label class="gender">
                  <input type="radio" name="inGender" value="Male" <%= gender.equals("Male")?"checked":"" %>>Male
                </label>
                <label class="gender">
                  <input type="radio" name="inGender" value="Female" <%= gender.equals("Female")?"checked":"" %>>Female
                </label>
          </div>
          <div class="formItem">
                <label for="inPass">Password</label>
                <input id="inPass" type="password" name="inPass" value='<%= pass %>'>
          </div>
          <div class="formItem">
                <%
                      String err = request.getParameter("err");
                      int errInt = (err!=null)?Integer.parseInt(err):-1;
                      
                      if(errInt > 0){
                        out.println("<div class='errMsg'>");
                        if(errInt == 1)
                          out.println("Username must be filled");
                        else if(errInt == 2)
                          out.println("Email must be filled");
                        else if(errInt == 3)
                          out.println("Email length must be > 4 character");
                        else if(errInt == 4)
                          out.println("Email must using the correct format");
                        else if(errInt == 5)
                          out.println("Gender must be choosed");
                        else if(errInt == 6)
                          out.println("Password must be filled");
                          out.println("</div>");
                      }
                %>
                <input id="inAddUser" type="submit" name="inAddUser" value='<%= (userId != null)?"Update User":"Insert User"%>'>
          </div>
        </form>
      </div>
      <div class="section"><%@ include file="../_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>