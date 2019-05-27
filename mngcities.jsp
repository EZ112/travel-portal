<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/mngcities.css">
  </head>
  <body>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");
    %>
    <% String heading = "Cities ";%>
    <% String tagline = "Available city list";%>
    <div class="container">
      <div class="section"><%@ include file="_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="_header.jsp"%>
      </div>
      <div class="section">
        <div class="citieslist">
          <table>
            <thead>
              <tr>
                <th> City</th>
                <th> Country</th>
                <th> Action</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td> Jakarta</td>
                <td> Indonesia</td>
                <td> 
                  <form action="mngcities/update.jsp" method="POST">
                    <input type="hidden" name="CitiesId" value="1">
                    <button class="editBtn" type="submit">Edit</button>
                  </form>
                  <form action="mngcities/delete.jsp" method="POST">
                    <input type="hidden" name="CitiesId" value="1">
                    <button class="deleteBtn" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td colspan="3" align="center">There is no data</td>
              </tr>
            </tbody>
          </table>
          <div>                                           <a href="mngcities/insert.jsp">Insert Cities</a></div>
        </div>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>