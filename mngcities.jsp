<%@ page import="java.util.Vector" %>
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
    <%@ include file = "./model/City.jsp"%>
    <%@ include file = "./controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");

          Vector<City> cities = new Vector<City>();
          String query = "SELECT * FROM cities_tbl";
          ResultSet rs = st.executeQuery(query);
          
          while(rs.next())
            cities.add(new City(rs.getInt(1), rs.getString(2), rs.getString(3)));
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
              <%
                      for(int i=0; i < cities.size(); i++){
              %>
              <tr>
                <td><%= cities.get(i).getCity() %></td>
                <td><%= cities.get(i).getCountry() %></td>
                <td> 
                  <form action="mngcities/modify.jsp" method="POST">
                    <input type="hidden" name="cityId" value='<%= cities.get(i).getCityId() %>'>
                    <button class="editBtn" type="submit">Edit</button>
                  </form>
                  <form action="controller/modifyCity.jsp" method="POST">
                    <input type="hidden" name="modifyType" value="Delete">
                    <input type="hidden" name="cityId" value='<%= cities.get(i).getCityId()%>'>
                    <button class="deleteBtn" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
              <%    
                    }
              %>
              <%
                    if(cities.size() < 1){
              %>
              <tr>
                <td colspan="3" align="center">There is no data</td>
              </tr>
              <%
                  }
              %>
            </tbody>
          </table>
          <div>                                           <a href="mngcities/modify.jsp">Insert Cities</a></div>
        </div>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>