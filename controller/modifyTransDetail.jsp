<%@ include file = "connect.jsp" %>
<%
    String modifyType = request.getParameter("modifyType");

    if(modifyType != null){
        int transDetailId = Integer.parseInt(request.getParameter("transDetailId"));

        try{
            String query = "DELETE FROM transactionsdetail_tbl WHERE TransDetailId = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, transDetailId);
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