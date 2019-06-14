<%@ include file = "connect.jsp" %>
<%
    String modifyType = request.getParameter("modifyType");

    if(modifyType != null){
        int transId = Integer.parseInt(request.getParameter("transId"));

        try{
            String query = "DELETE FROM transactions_tbl WHERE transId = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, transId);
            stmt.executeUpdate();
            response.sendRedirect("../mngtrans.jsp");
        }catch(Exception e){
            System.out.println(e);
        }
    }
    else{
        response.sendRedirect("../mngtrans.jsp");
    }

%>