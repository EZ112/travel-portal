<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/mngtrans.css">
  </head>
  <body>
    <%@ include file = "./model/Trans.jsp"%>
    <%@ include file = "./controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");

          Vector<Trans> transactions = new Vector<Trans>();
          String query = "SELECT a.TransId, a.InvoiceNum, a.PurchaseDate, b.Fullname, a.Status FROM transactions_tbl a JOIN users_tbl b ON a.BuyerId = b.UserId";
          ResultSet rs = st.executeQuery(query);

          while(rs.next())
            transactions.add(new Trans(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5)));
    %>
    <% String heading = "Transaction ";%>
    <% String tagline = "On progress transaction";%>
    <div class="container">
      <div class="section"><%@ include file="_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="_header.jsp"%>
      </div>
      <div class="section">
        <div class="translist">
          <table>
            <thead>
              <tr>
                <th> Invoice Number</th>
                <th> Date</th>
                <th> Buyer</th>
                <th> Status</th>
                <th> Action</th>
              </tr>
            </thead>
            <tbody>
              <%
                    for(int i = 0; i < transactions.size(); i++){
              %>
              <tr>
                <td><%= transactions.get(i).getInvoiceNum() %></td>
                <td><%= transactions.get(i).getPurchaseDate() %></td>
                <td><%= transactions.get(i).getBuyer() %></td>
                <td>
                  <% if(transactions.get(i).getStatus().equals("Approved")) 
                            out.println("<label class='status approvedSts'>");
                        else if(transactions.get(i).getStatus().equals("Pending")) 
                          out.println("<label class='status pendingSts'>");
                        else 
                          out.println("<label class='status rejectedSts'>");
                  %>
                  <%= transactions.get(i).getStatus() %></label> 
                </td>
                <td>
                  <form action="mngtrans/view.jsp" method="POST">
                    <input type="hidden" name="transId" value='<%= transactions.get(i).getTransId() %>'>
                    <input type="hidden" name="invoiceNum" value='<%= transactions.get(i).getInvoiceNum() %>'>
                    <input type="hidden" name="status" value='<%= transactions.get(i).getStatus() %>'>
                    <button class="viewBtn" type="submit">View</button>
                  </form>
                  <form action="mngtrans/modify.jsp" method="POST">
                    <input type="hidden" name="transId" value='<%= transactions.get(i).getTransId() %>'>
                    <input type="hidden" name="invoiceNum" value='<%= transactions.get(i).getInvoiceNum() %>'>
                    <input type="hidden" name="status" value='<%= transactions.get(i).getStatus() %>'>
                    <button class="editBtn" type="submit" <% if(!transactions.get(i).getStatus().equals("Pending")) out.print("disabled"); %>>Edit</button>
                  </form>
                  <form action="controller/modifyTrans.jsp" method="POST">
                    <input type="hidden" name="modifyType" value="Delete">
                    <input type="hidden" name="transId" value='<%= transactions.get(i).getTransId() %>'>
                    <button class="deleteBtn" type="submit" <% if(!transactions.get(i).getStatus().equals("Pending")) out.print("disabled"); %>>Delete</button>
                  </form>
                </td>
              </tr>
              <%
                    }
              %>
              <%
                    if(transactions.size() < 1){
              %>
              <tr>
                <td colspan="5" align="center">There is no data</td>
              </tr>
              <%
                  }
              %>
            </tbody>
          </table>
        </div>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>