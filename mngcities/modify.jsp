<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="../assets/css/modifycities.css">
  </head>
  <body>
    <%@ include file = "../controller/connect.jsp"%>
    <%
          String role = (String)session.getAttribute("role");
          if(role == null || !role.equals("Admin"))
            response.sendRedirect("index.jsp");

          String cityId = request.getParameter("cityId");

          String city = "";
          String country = "";
          String modifyType = (cityId != null)?"Update":"Insert";
       
          String query = "SELECT * FROM cities_tbl where cityId = " +cityId;
          ResultSet rs = st.executeQuery(query);

          while(rs.next()){
            city = rs.getString(2);
            country = rs.getString(3);
          } 
    %>
    <% String heading = (cityId != null)?"Update City":"Insert City";%>
    <% String tagline = (cityId != null)?"Update active city":"Insert new city";%>
    <div class="container">
      <div class="section"><%@ include file="../_menuadmin.jsp"%>
      </div>
      <div class="section"><%@ include file="../_header.jsp"%>
      </div>
      <div class="section">
        <form action="./controller/modifyCity.jsp" method="POST">
        <input type="hidden" name="modifyType" value='<%= modifyType%>'>
        <input type="hidden" name="cityId" value='<%= cityId%>'>
          <div class="formItem">
                <label for="inCity">City</label>
                <input id="inCity" type="text" name="inCity" value='<%= city%>'>
          </div>
          <div class="formItem">
                <label for="inCountry">Country</label>
                <input id="inCountry" type="text" name="inCountry" value='<%= country%>'>
          </div>
          <div class="formItem">
                <%
                      String err = request.getParameter("err");
                      int errInt = (err!=null)?Integer.parseInt(err):-1;
                      
                      if(errInt > 0){
                        out.println("<div class='errMsg'>");
                        if(errInt == 1)
                          out.println("City must be filled");
                        else if(errInt == 2)
                          out.println("Country must be filled");
                          out.println("</div>");
                      }
                %>
                <input id="inAddCity" type="submit" name="inAddCity" value='<%= (cityId != null)?"Update City":"Insert City"%>'>
          </div>
        </form>
      </div>
      <div class="section"><%@ include file="../_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>