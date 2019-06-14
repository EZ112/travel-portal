<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/index.css">
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

          Date today = new Date();
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
          String todayStr = sdf.format(today);
          
          Vector<City> cities = new Vector<City>();
          String query = "SELECT * FROM cities_tbl";
          ResultSet rs = st.executeQuery(query);
          
          while(rs.next())
              cities.add(new City(rs.getInt(1), rs.getString(2), rs.getString(3)));
          
          int maxPass = 0;
          query = "SELECT MAX(AvailSeat) FROM tickets_tbl";
          rs = st.executeQuery(query);

          while(rs.next())
            maxPass = rs.getInt(1);
          
    %>
    <% String heading = "Where are you going ?";%>
    <% String tagline = "Ticket anywhre only at TravelProtal";%>
    <% String tagline2 = "Booking is faster, easier and cheaper";%>
    <div class="container">
      <div class="section">
          <jsp:include page='<%= menu%>' flush='true' />
      </div>
      <div class="section"><%@ include file="_homeheader.jsp"%>
      </div>
      <div class="section">
        <form action="search.jsp" method="GET">
          <div class="formItem heading-2"><%= heading%></div>
          <div class="formItem">
                <label for="ddlFrom">From</label>
                <select id="ddlFrom" name="ddlFrom">
                    <%
                            for(int i = 0; i < cities.size(); i++){
                    %>
                    <option value='<%= cities.get(i).getCity()%>'><%= cities.get(i).getCity()%></option>
                    <%
                            }
                    %>
                </select>
          </div>
          <div class="formItem">
                <label for="ddlTo">To</label>
                <select id="ddlTo" name="ddlTo">
                    <%
                            for(int i = 0; i < cities.size(); i++){
                    %>
                    <option value='<%= cities.get(i).getCity()%>'><%= cities.get(i).getCity()%></option>
                    <%
                            }
                    %>
                </select>
          </div>
          <div class="formItem">
                <label for="inDate">Departure Date</label>
                <input id="inDate" type="date" name="inDate"value="<%= todayStr%>" min="<%= todayStr%>">
          </div>
          <div class="formItem">
                <label for="ddlPass">Passangers</label>
                <select id="ddlPass" name="ddlPass">
                    <%
                            for(int i = 1; i <= maxPass; i++){
                              out.print("<option value='"+i+"'>"+i+"</option>");
                            }
                    %>
                </select>
          </div>
          <div class="formItem">
                <label for="ddlCabin">Cabin Class</label>
                <select id="ddlCabin" name="ddlCabin">
                  <option value="Economy">Economy</option>
                  <option value="Business">Business</option>
                </select>
          </div>
          <div class="formItem">
            <input type="submit" value="Search Flight">
          </div>
        </form>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
</html>