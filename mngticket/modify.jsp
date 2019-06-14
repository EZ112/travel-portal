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
    <link rel="stylesheet" href="../assets/css/modifyticket.css">
  </head>
  <body>
    <%@ include file = "../model/City.jsp"%>
    <%@ include file = "../controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");

          String ticketId = request.getParameter("ticketId");

          String airline = "";
          int fromDestId = 0;
          int toDestId = 0;
          int priceEconomy = 0;
          int priceBusiness = 0;
          Date today = new Date();
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
          String todayStr = sdf.format(today);
          Date departureDate = new Date();
          int availSeat = 0;
          String modifyType = (ticketId != null)?"Update":"Insert";
       
          String query = "SELECT * FROM tickets_tbl where ticketId = " +ticketId;
          ResultSet rs = st.executeQuery(query);

          while(rs.next()){
            airline = rs.getString(2);
            fromDestId = rs.getInt(3);
            toDestId = rs.getInt(4);
            priceEconomy = rs.getInt(5);
            priceBusiness = rs.getInt(6);
            departureDate = rs.getDate(7);
            availSeat = rs.getInt(8);
          }
        
          Vector<City> cities = new Vector<City>();
          query = "SELECT * FROM cities_tbl";
          rs = st.executeQuery(query);
          
          while(rs.next())
              cities.add(new City(rs.getInt(1), rs.getString(2), rs.getString(3)));

    %>
    <% String heading = (ticketId != null)?"Update Ticket":"Insert Ticket";%>
    <% String tagline = (ticketId != null)?"Update the ticket":"Insert new ticket for airlines";%>
    <div class="container">
      <div class="section"><%@ include file="../_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="../_header.jsp"%>
      </div>
      <div class="section">
        <form action="./controller/modifyTicket.jsp" method="POST">
        <input type="hidden" name="modifyType" value='<%= modifyType%>'>
        <input type="hidden" name="ticketId" value='<%= ticketId%>'>
          <div class="formItem">
                <label for="ddlAirline">Airline</label>
                <input id="inAirline" type="text" name="inAirline" value="<%= airline%>">
          </div>
          <div class="formItem">
                <label for="ddlFrom">From</label>
                <select id="ddlFrom" name="ddlFrom">
                    <%
                            for(int i = 0; i < cities.size(); i++){
                    %>
                    <option value='<%= cities.get(i).getCityId()%>' <% if(cities.get(i).getCityId() == fromDestId) out.print("selected"); %>><%= cities.get(i).getCity()%></option>
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
                    <option value='<%= cities.get(i).getCityId()%>' <% if(cities.get(i).getCityId() == fromDestId) out.print("selected"); %>><%= cities.get(i).getCity()%></option>
                    <%
                            }
                    %>
                </select>
          </div>
          <div class="formItem">
                <label for="inPriceEco">Price Economy (Rp.)</label>
                <input id="inPriceEco" type="text" name="inPriceEco" value='<%= priceEconomy%>' pattern="[0-9]+" title="Price Economy must be numeric">
          </div>
          <div class="formItem">
                <label for="inPriceBus">Price Business (Rp.)</label>
                <input id="inPriceBus" type="text" name="inPriceBus" value='<%= priceBusiness%>' pattern="[0-9]+" title="Price Business must be numeric">
          </div>
          <div class="formItem">
                <label for="inDate">Departure Date</label>
                <input id="inDate" type="date" name="inDate" value='<%= departureDate%>' min='<%= todayStr%>'>
          </div>
          <div class="formItem">
                <label for="inSeat">Available Seat</label>
                <input id="inSeat" type="text" name="inSeat" value='<%= availSeat%>'>
          </div>
          <div class="formItem">
              <%
                      String err = request.getParameter("err");
                      int errInt = (err!=null)?Integer.parseInt(err):-1;
                      
                      if(errInt > 0){
                        out.println("<div class='errMsg'>");
                        if(errInt == 1)
                          out.println("Airline must be filled");
                        else if(errInt == 2)
                          out.println("From must be selected");
                        else if(errInt == 3)
                          out.println("To must be selected");
                        else if(errInt == 4)
                          out.println("Price Economy must be filled");
                        else if(errInt == 5)
                          out.println("Price Business must be filled");
                        else if(errInt == 6)
                          out.println("Date must be filled");
                        else if(errInt == 7)
                          out.println("Available Seat must be filled");
                          out.println("</div>");
                      }
                %>
                <input id="inInsertTicket" type="submit" name="inInsertTicket" value='<%= (ticketId != null)?"Update Ticket":"Insert Ticket"%>'>
          </div>
        </form>
      </div>
      <div class="section"><%@ include file="../_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>