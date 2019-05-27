<%@ include file = "connect.jsp" %>

<%
    String email = request.getParameter("inEmail");
    String pass = request.getParameter("inPass");
    boolean rmrMe = request.getParameter("inCheckBox")!=null?true:false;
    int online = 0;

    if(email.equals(""))
        response.sendRedirect("../signin.jsp?err=1");   
    else if(email.length() < 4)
        response.sendRedirect("../signin.jsp?err=2");
    else if(!email.matches("[a-z0-9]+@[a-z0-9]+\\.[a-z0-9]+"))
        response.sendRedirect("../signin.jsp?err=3");   
    else if(pass.equals(""))
        response.sendRedirect("../signin.jsp?err=4");   
    else{
            String query = "SELECT * FROM users_tbl WHERE Email = '"+email+"'AND Password = '"+pass+"'";
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
                String loggedName = rs.getString(2);
                String loggedRole = rs.getString(6);
                
                if(application.getAttribute("online") == null)
                    online = 0;
                else
                    online = (Integer) application.getAttribute("online");

                online++;
                application.setAttribute("online",online);
                session.setAttribute("name", loggedName);
                session.setAttribute("role", loggedRole);

                if(rmrMe){
                    Cookie cookies = new Cookie("name", loggedName);
                    cookies.setMaxAge(60*60*24);
                    cookies.setPath("/");
                    response.addCookie(cookies);
                }

                response.sendRedirect("../index.jsp");
            }
            else{
                response.sendRedirect("../signin.jsp?err=5");
            }
    }

%>