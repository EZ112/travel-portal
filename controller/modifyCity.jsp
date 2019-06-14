<%@ include file = "connect.jsp" %>
<%
    String modifyType = request.getParameter("modifyType");

    if(modifyType.equals("Insert")){
        String city = request.getParameter("inCity");
        String country = request.getParameter("inCountry");

        if(city.equals(""))
            response.sendRedirect("../mngcity/modify.jsp?err=1");   
        else if(country.equals(""))
            response.sendRedirect("../mngcity/modify.jsp?err=2");   
        
        else{
                try{
                    String query = "INSERT INTO cities_tbl(City, Country) VALUES (?,?)";

                    PreparedStatement stmt = con.prepareStatement(query);
                    stmt.setString(1,city);
                    stmt.setString(2,country);

                    stmt.executeUpdate();

                    response.sendRedirect("../mngcity.jsp");
                }catch(Exception e){
                    out.println(e);
                }
        }
        
    }
    else if(modifyType.equals("Update")){        
            String cityId = request.getParameter("cityId");
            String city = request.getParameter("inCity");
            String country = request.getParameter("inCountry");

            if(city.equals(""))
                response.sendRedirect("../mngcity/modify.jsp?err=1&cityId="+cityId);   
            else if(country.equals(""))
                response.sendRedirect("../mngcity/modify.jsp?err=2&cityId="+cityId);
            else{
                try{
                    String query = "UPDATE cities_tbl SET City = ?, Country = ? WHERE CityId = ?";
                    PreparedStatement stmt = con.prepareStatement(query);
                    stmt.setString(1, city);
                    stmt.setString(2, country);
                    stmt.setString(3, cityId);

                    stmt.executeUpdate();

                    response.sendRedirect("../mngcity.jsp");
                }catch(Exception e){
                    System.out.println(e);
                }
            }
    }
    else if(modifyType.equals("Delete")){
        int cityId = Integer.parseInt(request.getParameter("cityId"));

        try{
            String query = "DELETE FROM cities_tbl WHERE CityId = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, cityId);
            stmt.executeUpdate();
            response.sendRedirect("../mngcity.jsp");
        }catch(Exception e){
            System.out.println(e);
        }

       
    }
%>