<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="../assets/css/insertticket.css">
  </head>
  <body>
    <%! String heading = "Insert Ticket";%>
    <%! String tagline = "Insert new ticket for airlines";%>
    <div class="container">
      <div class="section"><%@ include file="../_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="../_header.jsp"%>
      </div>
      <div class="section">
        <form action="">
          <div class="formItem">
                <label for="ddlAirline">Airline</label>
                <select id="ddlAirline" name="ddlAirline">
                  <option value="Garuda Indonesia">Garuda Indonesia</option>
                </select>
          </div>
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
                <label for="inPriceEco">Price Economy (Rp.)</label>
                <input id="inPriceEco" type="text" name="inPriceEco">
          </div>
          <div class="formItem">
                <label for="inPriceBus">Price Business (Rp.)</label>
                <input id="inPriceBus" type="text" name="inPriceBus">
          </div>
          <div class="formItem">
                <label for="inDate">Departure Date</label>
                <input id="inDate" type="date" name="inDate">
          </div>
          <div class="formItem">
                <label for="inSeat">Available Seat</label>
                <input id="inSeat" type="text" name="inSeat">
          </div>
          <div class="formItem">
                <input id="inInsertTicket" type="submit" name="inInsertTicket" value="Insert Ticket">
          </div>
        </form>
      </div>
      <div class="section"><%@ include file="../_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>