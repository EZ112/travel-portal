<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="../assets/css/viewtrans.css">
  </head>
  <body>
    <%@ include file = "../model/TransDetail.jsp"%>
    <%@ include file = "../controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");

          int transId = Integer.parseInt(request.getParameter("transId"));
          String invoiceNum = request.getParameter("invoiceNum");
          String status = request.getParameter("status");

          Vector<TransDetail> transDetails = new Vector<TransDetail>();
          String query = "SELECT * FROM transactionsdetail_tbl WHERE TransId =  " + transId;
          ResultSet rs = st.executeQuery(query);
          
          while(rs.next())
            transDetails.add(new TransDetail(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5)));
    %>
    <% String heading = "Transaction Details";%>
    <% String tagline = "Detail of selected transaction";%>
    <div class="container">
      <div class="section"><%@ include file="../_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="../_header.jsp"%>
      </div>
      <div class="section">
        <div class="translist">
          <div>
            <label class="invoice"><%= invoiceNum%></label>
            <% if(status.equals("Approved")) 
                    out.println("<label class='status approvedSts'>");
                else if(status.equals("Pending")) 
                  out.println("<label class='status pendingSts'>");
                else 
                  out.println("<label class='status rejectedSts'>");
          %>
          <%= status %></label> 
          </div>
          <table>
            <thead>
              <tr>
                <th> Person Title</th>
                <th> Person Name</th>
                <th> Person Nasionality</th>
              </tr>
            </thead>
            <tbody>
              <%
                    for(int i = 0; i < transDetails.size(); i++){
              %>
              <tr>
                <td><%= transDetails.get(i).getTitle() %></td>
                <td><%= transDetails.get(i).getName() %></td>
                <td><%= transDetails.get(i).getNationality() %></td>
              </tr>
              <%
                    }
              %>
            </tbody>
          </table>
          <form class="formNav" action="./controller/transApproval.jsp" method="POST">
            <%
                  if(status.equals("Pending")){
            %>
            <input type="hidden" name="transId" value='<%= transId %>'>
            <button name="approval" type="submit" value="Approved">Approve</button>
            <button name="approval" type="submit" value="Rejected">Reject</button>
            <%
                  }
            %>
            <button type="submit" value="mngtrans.jsp">Back</button>
          </form>
        </div>
      </div>
      <div class="section"><%@ include file="../_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>