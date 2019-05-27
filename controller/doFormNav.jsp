<%
    String approveBtn = request.getParameter("approveBtn");
    String rejectBtn = request.getParameter("rejectBtn");
    String backBtn = request.getParameter("backBtn");
    
    if(approveBtn != null)
        out.println(approveBtn);
    else if(rejectBtn != null)
        out.println(rejectBtn);
    else if(backBtn != null)
        response.sendRedirect("../"+backBtn);
%>