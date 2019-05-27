<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/mnguser.css">
  </head>
  <body>
    <%@ include file = "./model/User.jsp"%>
    <%@ include file = "./controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");
          
          Vector<User> users = new Vector<User>();
          String query = "SELECT * FROM users_tbl";
          ResultSet rs = st.executeQuery(query);

          while(rs.next())
            users.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
    %>
    <% String heading = "Users ";%>
    <% String tagline = "Active user list";%>
    <div class="container">
      <div class="section"><%@ include file="_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="_header.jsp"%>
      </div>
      <div class="section">
        <div class="userlist">
          <table>
            <thead>
              <tr>
                <th> Name</th>
                <th> Email</th>
                <th> Password</th>
                <th> Gender</th>
                <th> Action</th>
              </tr>
            </thead>
            <tbody>
              <%
                    for(int i = 0; i < users.size(); i++){
              %>
              <tr>
                <td><%= users.get(i).getFullname() %></td>
                <td><%= users.get(i).getEmail() %></td>
                <td><%= users.get(i).getPass() %></td>
                <td><%= users.get(i).getGender() %></td>
                <td> 
                  <form action="mnguser/modify.jsp" method="POST">
                    <input type="hidden" name="userId" value='<%= users.get(i).getUserId() %>'>
                    <button class="editBtn" type="submit">Edit</button>
                  </form>
                  <form action="controller/modifyUser.jsp" method="POST">
                    <input type="hidden" name="modifyType" value="Delete">
                    <input type="hidden" name="userId" value='<%= users.get(i).getUserId() %>'>
                    <button class="deleteBtn" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
              <%    
                    }
              %>
              <%
                    if(users.size() < 1){
              %>
              <tr>
                <td colspan="5" align="center">There is no data</td>
              </tr>
              <%
                  }
              %>
            </tbody>
          </table>
          <div>                                           <a href="mnguser/modify.jsp">Insert User</a></div>
        </div>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>