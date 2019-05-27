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
    <% String heading = "Where are you going ?";%>
    <% String tagline = "Ticket anywhre only at TravelProtal";%>
    <% String tagline2 = "Booking is faster, easier and cheaper";%>
    <div class="container">
      <div class="section">
          <%
                String role = (String)session.getAttribute("role");
                String menu = "";
                if(role!=null)
                  menu = role.equals("Admin")?"_menuadmin.jsp":"_menutag.jsp";
                else
                  menu = "_menutag.jsp"; 
          %>
          <jsp:include page='<%= menu%>' flush='true' />
      </div>
      <div class="section"><%@ include file="_homeheader.jsp"%>
      </div>
      <div class="section">
        <form action="search.jsp" method="POST">
          <div class="formItem heading-2"><%= heading%></div>
          <div class="formItem">
                <label for="ddlFrom">From</label>
                <select id="ddlFrom" name="ddlFrom">
                  <option value="Jakarta">Jakarta</option>
                </select>
          </div>
          <div class="formItem">
                <label for="ddlTo">To</label>
                <select id="ddlTo" name="ddlTo">
                  <option value="Jakarta">Jakarta</option>
                </select>
          </div>
          <div class="formItem">
                <label for="inDate">Departure Date</label>
                <input id="inDate" type="date" name="inDate">
          </div>
          <div class="formItem">
                <label for="ddlPass">Passangers</label>
                <select id="ddlPass" name="ddlPass">
                  <option value="1">1</option>
                </select>
          </div>
          <div class="formItem">
                <label for="ddlCabin">Cabin Class</label>
                <select id="ddlCabin" name="ddlCabin">
                  <option value="Economy">Economy</option>
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