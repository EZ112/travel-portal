<%@ page import="java.util.Date" %>
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
    <%@ include file = "../model/Airline.jsp"%>
    <%@ include file = "../model/Dest.jsp"%>
    <%@ include file = "../controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");

          String ticketId = request.getParameter("ticketId");

          int airlineId = 0;
          int fromDestId = 0;
          int toDestId = 0;
          int priceEconomy = 0;
          int priceBusiness = 0;
          Date departureDate = new Date();
          int availSeat = 0;
          String modifyType = (ticketId != null)?"Update":"Insert";
       
          String query = "SELECT * FROM tickets_tbl where ticketId = " +ticketId;
          ResultSet rs = st.executeQuery(query);

          while(rs.next()){
            airlineId = rs.getInt(2);
            fromDestId = rs.getInt(3);
            toDestId = rs.getInt(4);
            priceEconomy = rs.getInt(5);
            priceBusiness = rs.getInt(6);
            departureDate = rs.getDate(7);
            availSeat = rs.getInt(8);
          }
          
          Vector<Airline> airlines = new Vector<Airline>();
          query = "SELECT * FROM airline_tbl";
          rs = st.executeQuery(query);

          while(rs.next())
            airlines.add(new Airline(rs.getInt(1), rs.getString(2)));
        
        Vector<Dest> destinations = new Vector<Dest>();
        query = "SELECT * FROM dest_tbl";
        rs = st.executeQuery(query);
        
        while(rs.next())
            destinations.add(new Dest(rs.getInt(1), rs.getString(2)));

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
                <select id="ddlAirline" name="ddlAirline">
                    <%
                            for(int i = 0; i < airlines.size(); i++){
                    %>
                    <option value='<%= airlines.get(i).getAirlineId() %>' <% if(airlines.get(i).getAirlineId() == airlineId) out.print("selected"); %>><%= airlines.get(i).getAirline() %></option>
                    <%
                            }
                    %>
                </select>
          </div>
          <div class="formItem">
                <label for="ddlFrom">From</label>
                <select id="ddlFrom" name="ddlFrom">
                    <%
                            for(int i = 0; i < destinations.size(); i++){
                    %>
                    <option value='<%= destinations.get(i).getDestId()%>' <% if(destinations.get(i).getDestId() == fromDestId) out.print("selected"); %>><%= destinations.get(i).getDestination()%></option>
                    <%
                            }
                    %>
                </select>
          </div>
          <div class="formItem">
                <label for="ddlTo">To</label>
                <select id="ddlTo" name="ddlTo">
                    <%
                            for(int i = 0; i < destinations.size(); i++){
                    %>
                    <option value='<%= destinations.get(i).getDestId()%>' <% if(destinations.get(i).getDestId() == toDestId) out.print("selected"); %>><%= destinations.get(i).getDestination()%></option>
                    <%
                            }
                    %>
                </select>
          </div>
          <div class="formItem">
                <label for="inPriceEco">Price Economy (Rp.)</label>
                <input id="inPriceEco" type="text" name="inPriceEco" value='<%= priceEconomy%>'>
          </div>
          <div class="formItem">
                <label for="inPriceBus">Price Business (Rp.)</label>
                <input id="inPriceBus" type="text" name="inPriceBus" value='<%= priceBusiness%>'>
          </div>
          <div class="formItem">
                <label for="inDate">Departure Date</label>
                <input id="inDate" type="date" name="inDate" value='<%= departureDate%>'>
          </div>
          <div class="formItem">
                <label for="inSeat">Available Seat</label>
                <input id="inSeat" type="text" name="inSeat" value='<%= availSeat%>'>
          </div>
          <div class="formItem">
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