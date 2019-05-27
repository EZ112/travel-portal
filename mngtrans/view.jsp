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
            <label class="invoice">INV/20190101/9736249182736</label>
            <label class="status pendingSts">Pending</label>
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
              <tr>
                <td> Mr</td>
                <td> Steven Martin</td>
                <td>Indonesia</td>
              </tr>
              <tr>
                <td> Mrs</td>
                <td> Angela Irena Ardianti</td>
                <td>Indonesia</td>
              </tr>
              <tr>
                <td colspan="5" align="center">There is no data</td>
              </tr>
            </tbody>
          </table>
          <form class="formNav" action="action/doFormNav.jsp" method="POST">
            <button name="approveBtn" type="submit" value="Approve">Approve</button>
            <button name="rejectBtn" type="submit" value="Reject">Reject</button>
            <button name="backBtn" type="submit" value="mngtrans.jsp">Back</button>
          </form>
        </div>
      </div>
      <div class="section"><%@ include file="../_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>