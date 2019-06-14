<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/personalinfo.css">
  </head>
  <body>
    <%@ include file = "./model/City.jsp"%>
    <%@ include file = "./controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          String menu = "";
          if(role!=null)
            menu = role.equals("Admin")?"_menuadmin.jsp":"_menutag.jsp";
          else
            menu = "_menutag.jsp";

          Vector<String> cities = new Vector<String>();
          String query = "SELECT DISTINCT Country FROM cities_tbl";
          ResultSet rs = st.executeQuery(query);

          while(rs.next())
                cities.add(rs.getString(1));
          
          String fromDest = request.getParameter("fromDest");
          String toDest = request.getParameter("toDest");
          int price = Integer.parseInt(request.getParameter("price"));
          int ddlPass = Integer.parseInt(request.getParameter("ddlPass"));
    %>
    <div class="container">
      <div class="section">
          <jsp:include page='<%= menu%>' flush='true' />
      </div>
      <div class="section">
        <form class="passagerList" action="payment.jsp" method="POST">
            <input type="hidden" name="fromDest" value="<%= fromDest %>">
            <input type="hidden" name="toDest" value="<%= toDest %>">
            <input type="hidden" name="totalPrice" value="<%= (price * ddlPass) %>">
            <% for(int i = 0; i < ddlPass; i++){ %>
            <div class="headList">
                <div class="no"><%= (i+1) %></div>
                <div class="listlabel">Passenger Information</div>
            </div>
          <table>
              <thead>
                  <th>Title</th>
                  <th>Name</th>
                  <th>Nationality</th>
              </thead>
              <tbody>
                  <tr>
                      <td>
                          <select name="ddlTitle" id="">
                              <option value="Mr">Mr</option>
                              <option value="Mrs">Mrs</option>
                          </select>
                        </td>
                      <td><input type="text" name="inName" required></td>
                      <td>
                          <select name="ddlNationality" id="">
                                <%
                                        for(int j = 0; j < cities.size(); j++){
                                %>
                                <option value='<%= cities.get(j)%>'><%= cities.get(j)%></option>
                                <%
                                        }
                                %>
                          </select>
                        </td>
                  </tr>
              </tbody>
          </table>
          <%
            }
        %>
        <div>
                <input type="submit" value="Purchase Ticket(s)">
        </div>
        </form>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>