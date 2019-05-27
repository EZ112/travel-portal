<%@ include file = "connect.jsp" %>

<%
    String name = request.getParameter("inName");
    String email = request.getParameter("inEmail");
    String pass = request.getParameter("inPass");
    String passConf = request.getParameter("inPassConf");
    String gender = request.getParameter("inGender");


    if(name.equals(""))
        response.sendRedirect("../signup.jsp?err=1");   
    else if(email.equals(""))
        response.sendRedirect("../signup.jsp?err=2");   
    else if(email.length() < 4)
        response.sendRedirect("../signup.jsp?err=3");
    else if(!email.matches("[a-z0-9]+@[a-z0-9]+\\.[a-z0-9]+"))
        response.sendRedirect("../signup.jsp?err=4");   
    else if(pass.equals(""))
        response.sendRedirect("../signup.jsp?err=5");   
    else if(passConf.equals(""))
        response.sendRedirect("../signup.jsp?err=6");  
    else if(!pass.equals(passConf))
        response.sendRedirect("../signup.jsp?err=7");    
    else if(gender == null)
        response.sendRedirect("../signup.jsp?err=8");
    else{
            try{
                String query = "INSERT INTO users_tbl(Fullname, Email, Password, Gender, Role) VALUES (?,?,?,?,?)";

                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setString(1,name);
                stmt.setString(2,email);
                stmt.setString(3,pass);
                stmt.setString(4,gender);
                stmt.setString(5,"User");

                stmt.executeUpdate();

                response.sendRedirect("../signup.jsp?err=0");
            }catch(Exception e){
                out.println(e);
            }
    }

%>