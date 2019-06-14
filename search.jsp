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
    <link rel="stylesheet" href="assets/css/search.css">
  </head>
  <body>
    <%@ include file = "./model/Ticket.jsp"%>
    <%@ include file = "./controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          String menu = "";
          if(role!=null)
            menu = role.equals("Admin")?"_menuadmin.jsp":"_menutag.jsp";
          else
            menu = "_menutag.jsp";
          
          String fromDest = request.getParameter("ddlFrom");
          String toDest = request.getParameter("ddlTo");
          String deptDate = request.getParameter("inDate");
          int ddlPass = Integer.parseInt(request.getParameter("ddlPass"));
          String ddlCabin = request.getParameter("ddlCabin");

          int currPage = 1;
          if(request.getParameter("page") != null)
              currPage = Integer.parseInt(request.getParameter("page"));

          int perPage = 5;
          int offSet = (currPage - 1) * perPage;

          Vector<Ticket> tickets = new Vector<Ticket>();
          String query = "SELECT a.TicketId, a.Airline, b.City, c.City, a.PriceEconomy, a.PriceBusiness, a.DepartureDate, a.AvailSeat FROM tickets_tbl a JOIN cities_tbl b ON a.FromDestId = b.CityId JOIN cities_tbl c ON a.ToDestId = c.CityId WHERE b.City = ? AND c.City = ? AND DepartureDate >= ? AND a.AvailSeat >= ? LIMIT ?,?";
          PreparedStatement stmt = con.prepareStatement(query);
          stmt.setString(1, fromDest);
          stmt.setString(2, toDest);
          stmt.setString(3, deptDate);
          stmt.setInt(4, ddlPass);
          stmt.setInt(5, offSet);
          stmt.setInt(6, perPage);
          ResultSet rs = stmt.executeQuery();

          while(rs.next())
            tickets.add(new Ticket(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getInt(8)));
    %>
    <div class="container">
      <div class="section">
          <jsp:include page='<%= menu%>' flush='true' />
      </div>
      <div class="section">
        <%
              for(int i = 0; i < tickets.size(); i++){
        %>
        <div class="ticketlist">
          <table>
            <tbody>
              <tr>
                <th> Airline</th>
                <th> From</th>
                <th> To</th>
                <th> Price</th>
                <td rowspan="2"> 
                  <form action="personalinfo.jsp" method="POST">
                    <input type="hidden" name="fromDest" value="<%= tickets.get(i).getFromDest() %>">
                    <input type="hidden" name="toDest" value="<%= tickets.get(i).getToDest() %>">
                    <% if(ddlCabin.equals("Economy"))
                            out.print("<input type='hidden' name='price' value='"+tickets.get(i).getPriceEconomy()+"'>");
                        else
                            out.print("<input type='hidden' name='price' value='"+tickets.get(i).getPriceBusiness()+"'>");
                  %>
                    <input type="hidden" name="ddlPass" value="<%= ddlPass%>">
                    <button>+</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td><%= tickets.get(i).getAirline() %></td>
                <td> 
                  <div class="fromDest"><%= tickets.get(i).getFromDest() %></div>
                </td>
                <td> 
                  <div class="toDest"><%= tickets.get(i).getToDest() %></div>
                </td>
                <td> <b>Rp. </b>  
                  <% if(ddlCabin.equals("Economy"))
                            out.print(tickets.get(i).getPriceEconomy());
                        else
                            out.print(tickets.get(i).getPriceBusiness());
                  %>
                </td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
        <%
              }
        %>
        <%
              if(tickets.size() < 1){
        %>
        <div class="ticketlist">
                Ticket not Found
        </div>
        <%
              }
        %>
        <div>
          <%
                query = "SELECT COUNT(*) FROM tickets_tbl a JOIN cities_tbl b ON a.FromDestId = b.CityId JOIN cities_tbl c ON a.ToDestId = c.CityId WHERE b.City = ? AND c.City = ? AND DepartureDate >= ? AND a.AvailSeat >= ?";
                stmt = con.prepareStatement(query);
                stmt.setString(1, fromDest);
                stmt.setString(2, toDest);
                stmt.setString(3, deptDate);
                stmt.setInt(4, ddlPass);
                rs = stmt.executeQuery();
                
                int totalTicket = 0;
                int totalPage = 0;
                
                while(rs.next()){
                  totalTicket = rs.getInt(1);
                  totalPage = totalTicket/perPage;
                }

                if(totalTicket%perPage != 0)
                  totalPage++;
                for(int i = 1; i <= totalPage; i++){
                  out.print("<a class='pages' href='search.jsp?ddlFrom="+fromDest+"&ddlTo="+toDest+"&inDate="+deptDate+"&ddlPass="+ddlPass+"&ddlCabin="+ddlCabin+"&page="+i+"'>");
                  out.print(i);
                  out.print("</a>");
                }
          %>
        </div>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>