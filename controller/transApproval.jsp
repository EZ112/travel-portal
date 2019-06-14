<%@ include file = "connect.jsp" %>
<%
        String approval = request.getParameter("approval");

        if(approval != null){
            int transId = Integer.parseInt(request.getParameter("transId"));
            try{
                String query = "UPDATE transactions_tbl SET Status = ? WHERE TransId = ?";

                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setString(1, approval);
                stmt.setInt(2, transId);

                stmt.executeUpdate();

                response.sendRedirect("../mngtrans.jsp");
            }catch(Exception e){
                out.println(e);
            }
        }
        else{
            response.sendRedirect("../mngtrans.jsp");
        }
%>