<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/payment.css">
  </head>
  <body>
    <%@ include file = "./controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          String menu = "";
          if(role!=null)
            menu = role.equals("Admin")?"_menuadmin.jsp":"_menutag.jsp";
          else
            response.sendRedirect("signin.jsp");

            String buyerId = (String)session.getAttribute("id");
            String buyer = (String)session.getAttribute("name");

            String fromDest = request.getParameter("fromDest");
            String toDest = request.getParameter("toDest");
            int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
          
            String[] ddlTitle = request.getParameterValues("ddlTitle");
            String[] inName = request.getParameterValues("inName");
            String[] ddlNationality = request.getParameterValues("ddlNationality");
    %>
    <% String heading = "Payment Confirmation ";%>
    <% String tagline = "Confirm your tickets";%>
    <div class="container">
      <div class="section">
            <jsp:include page='<%= menu%>' flush='true' />
      </div>
      <div class="section"><%@ include file="_header.jsp"%>
      </div>
      <div class="section">
            <div class="passangerDetail">
                <% for(int i = 0; i < ddlTitle.length; i++){ %>
                <div class="passagerList">
                    <div class="headList">
                        <div class="no"><%= (i+1)%></div>
                        <div class="listlabel">Passanger Information</div>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Nationality</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= ddlTitle[i] + ". " + inName[i] %></td>
                                <td><%= ddlNationality[i] %></td>
                            </tr>
                        </tbody>
                        <thead>
                            <tr>
                                <th>Departure</th>
                                <th>Arrival</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= fromDest%></td>
                                <td><%= toDest %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <%
                        }
                %>
            </div>
            <div class="buyerInformation">
                <h2>Buyer Information</h2>
                <label for="buyer" id="buyerLabel">Name</label>
                <div id="buyer"><%= buyer %></div>
                <label for="totalPrice" id="priceLabel">Total Price(s)</label>
                <div id="totalPrice"><b>Rp. </b><%= totalPrice%></div>
                <form action="./controller/doTrans.jsp" method="POST">
                    <input type="hidden" name="buyerId" value="<%= buyerId%>">
                    <input type="hidden" name="totalPrice" value="<%= totalPrice%>">
                    <input type="hidden" name="fromDest" value="<%= fromDest%>">
                    <input type="hidden" name="toDest" value="<%= toDest%>">
                    <% for(int i = 0; i < ddlTitle.length; i++){%>
                        <input type="hidden" name="title" value="<%= ddlTitle[i]%>">
                        <input type="hidden" name="name" value="<%= inName[i]%>">
                        <input type="hidden" name="nationality" value="<%= ddlNationality[i]%>">
                    <% } %> 
                    <input type="submit" value="Pay">
                </form>
                <form action="index.jsp" method="POST">
                        <input type="submit" value="Cancel">
                </form>
            </div>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>