<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="../assets/css/insertcities.css">
  </head>
  <body>
    <%! String heading = "Insert City";%>
    <%! String tagline = "Insert new city";%>
    <div class="container">
      <div class="section"><%@ include file="../_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="../_header.jsp"%>
      </div>
      <div class="section">
        <form action="">
          <div class="formItem">
                <label for="inCity">City</label>
                <input id="inCity" type="text" name="inCity">
          </div>
          <div class="formItem">
                <label for="inCountry">Country</label>
                <input id="inCountry" type="text" name="inCountry">
          </div>
          <div class="formItem">
                <input id="inAddCity" type="submit" name="inAddCity" value="Add City">
          </div>
        </form>
      </div>
      <div class="section"><%@ include file="../_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>