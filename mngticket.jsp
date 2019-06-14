<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/mngticket.css">
  </head>
  <body>
    <%@ include file = "./model/Ticket.jsp"%>
    <%@ include file = "./controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");
          Vector<Ticket> tickets = new Vector<Ticket>();
          String query = "SELECT a.TicketId, a.Airline, b.City, c.City, a.PriceEconomy, a.PriceBusiness, a.DepartureDate, a.AvailSeat FROM tickets_tbl a JOIN cities_tbl b ON a.FromDestId = b.CityId JOIN cities_tbl c ON a.ToDestId = c.CityId";
          ResultSet rs = st.executeQuery(query);

          while(rs.next())
            tickets.add(new Ticket(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getInt(8)));
    %>
    <% String heading = "Tickets ";%>
    <% String tagline = "Ticket list";%>
    <div class="container">
      <div class="section"><%@ include file="_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="_header.jsp"%>
      </div>
      <div class="section">
        <div class="ticketlist">
          <table>
            <thead>
              <tr>
                <th></th>
                <th>Price</th>
                <th></th>
              </tr>
              <tr>
                <th> Airline</th>
                <th> From</th>
                <th> To</th>
                <th> Departure Date</th>
                <th> Economy</th>
                <th> Business</th>
                <th> Seat</th>
                <th> Action</th>
              </tr>
            </thead>
            <tbody>
              <%
                    for(int i = 0; i < tickets.size(); i++){
              %>
              <tr>
                <td><%= tickets.get(i).getAirline() %></td>
                <td><%= tickets.get(i).getFromDest() %></td>
                <td><%= tickets.get(i).getToDest() %></td>
                <td><%= tickets.get(i).getDepartureDate() %></td>
                <td> <b>Rp. </b>  <%= tickets.get(i).getPriceEconomy() %></td>
                <td> <b>Rp. </b>  <%= tickets.get(i).getPriceBusiness() %></td>
                <td> <%= tickets.get(i).getAvailSeat() %></td>
                <td>
                  <form action="mngticket/modify.jsp" method="POST">
                    <input type="hidden" name="ticketId" value='<%= tickets.get(i).getTicketId() %>'>
                    <button class="editBtn" type="submit">Edit</button>
                  </form>
                  <form action="controller/modifyTicket.jsp" method="POST">
                    <input type="hidden" name="modifyType" value="Delete">
                    <input type="hidden" name="ticketId" value='<%= tickets.get(i).getTicketId() %>'>
                    <button class="deleteBtn" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
              <%
                    }
              %>
              <%
                    if(tickets.size() < 1){
              %>
              <tr>
                <td colspan="8" align="center">There is no data</td>
              </tr>
              <%
                  }
              %>
            </tbody>
          </table>
          <div>                                           <a href="mngticket/modify.jsp">Insert Ticket</a></div>
        </div>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>