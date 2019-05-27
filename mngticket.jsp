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
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");
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
                <th colspan="4"></th>
                <th colspan="2">Price</th>
                <th colspan="2"></th>
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
              <tr>
                <td> Garuda Indonesia</td>
                <td> Pontianak</td>
                <td> Jakarta</td>
                <td> 2019-01-20</td>
                <td> <b>Rp. </b>  980000</td>
                <td> <b>Rp. </b>  1200000</td>
                <td> 35</td>
                <td>
                  <form action="mngticket/update.jsp" method="POST">
                    <input type="hidden" name="TicketId" value="1">
                    <button class="editBtn" type="submit">Edit</button>
                  </form>
                  <form action="mngticket/delete.jsp" method="POST">
                    <input type="hidden" name="TicketId" value="1">
                    <button class="deleteBtn" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td colspan="8" align="center">There is no data</td>
              </tr>
            </tbody>
          </table>
          <div>                                           <a href="mngticket/insert.jsp">Insert Ticket</a></div>
        </div>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>