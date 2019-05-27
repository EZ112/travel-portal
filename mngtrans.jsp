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
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");
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
              <tr>
                <td> INV/20190101/9736249182736</td>
                <td> 2019-01-01</td>
                <td>Username</td>
                <td> 
                  <label class="status approvedSts">Approved</label>
                </td>
                <td>
                  <form action="mngtrans/view.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="viewBtn" type="submit">View</button>
                  </form>
                  <form action="mngtrans/update.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="editBtn" type="submit">Edit</button>
                  </form>
                  <form action="mngtrans/delete.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="deleteBtn" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td> INV/20190101/9736249182736</td>
                <td> 2019-01-01</td>
                <td>Username</td>
                <td> 
                  <label class="status pendingSts">Pending</label>
                </td>
                <td> 
                  <form action="mngtrans/view.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="viewBtn" type="submit">View</button>
                  </form>
                  <form action="mngtrans/update.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="editBtn" type="submit">Edit</button>
                  </form>
                  <form action="mngtrans/delete.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="deleteBtn" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td> INV/20190101/9736249182736</td>
                <td> 2019-01-01</td>
                <td>Username</td>
                <td> 
                  <label class="status canceledSts">Canceled</label>
                </td>
                <td> 
                  <form action="mngtrans/view.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="viewBtn" type="submit">View</button>
                  </form>
                  <form action="mngtrans/update.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="editBtn" type="submit">Edit</button>
                  </form>
                  <form action="mngtrans/delete.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="deleteBtn" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td> INV/20190101/9736249182736</td>
                <td> 2019-01-01</td>
                <td>Username</td>
                <td> 
                  <label class="status rejectedSts">Rejected</label>
                </td>
                <td> 
                  <form action="mngtrans/view.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="viewBtn" type="submit">View</button>
                  </form>
                  <form action="mngtrans/update.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="editBtn" type="submit">Edit</button>
                  </form>
                  <form action="mngtrans/delete.jsp" method="POST">
                    <input type="hidden" name="TransId" value="1">
                    <button class="deleteBtn" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td colspan="5" align="center">There is no data</td>
              </tr>
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