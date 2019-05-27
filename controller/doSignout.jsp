<%
    session.invalidate();

    int online = (Integer) application.getAttribute("online");

    if(online !=0){
        online--;
        application.setAttribute("online", online);
    }

    Cookie [] cookies = request.getCookies();
    for(int i=0; i<cookies.length; i++){
        if(cookies[i].getName().equals("name")){
            cookies[i].setMaxAge(0);
            cookies[i].setPath("/");
            response.addCookie(cookies[i]);
            break;
        }
    }
    response.sendRedirect("../index.jsp");
%>