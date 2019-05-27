<%@ include file = "connect.jsp" %>
<%
    String modifyType = request.getParameter("modifyType");

    if(modifyType.equals("Insert")){
        String name = request.getParameter("inName");
        String email = request.getParameter("inEmail");
        String gender = request.getParameter("inGender");
        String pass = request.getParameter("inPass");

        if(name.equals(""))
            response.sendRedirect("../mnguser/modify.jsp?err=1");   
        else if(email.equals(""))
            response.sendRedirect("../mnguser/modify.jsp?err=2");   
        else if(email.length() < 4)
            response.sendRedirect("../mnguser/modify.jsp?err=3");   
        else if(!email.matches("[a-z0-9]+@[a-z0-9]+\\.[a-z0-9]+"))
            response.sendRedirect("../mnguser/modify.jsp?err=4");
        else if(gender == null)
            response.sendRedirect("../mnguser/modify.jsp?err=5");      
        else if(pass.equals(""))
            response.sendRedirect("../mnguser/modify.jsp?err=6");
        
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

                    response.sendRedirect("../mnguser.jsp");
                }catch(Exception e){
                    out.println(e);
                }
        }
        
    }
    else if(modifyType.equals("Update")){
        try{
            String userId = request.getParameter("userId");
            String name = request.getParameter("inName");
            String email = request.getParameter("inEmail");
            String gender = request.getParameter("inGender");
            String pass = request.getParameter("inPass");

            String query = "UPDATE users_tbl SET Fullname = ?, Email = ?, Password = ?, Gender = ?, Role = ? WHERE UserId = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, pass);
            stmt.setString(4, gender);
            stmt.setString(5, "User");
            stmt.setString(6, userId);
            stmt.executeUpdate();

            response.sendRedirect("../mnguser.jsp");
        }catch(Exception e){
            System.out.println(e);
        }
    }
    else if(modifyType.equals("Delete")){
        int userId = Integer.parseInt(request.getParameter("userId"));

        try{
            String query = "DELETE FROM users_tbl WHERE UserId = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, userId);
            stmt.executeUpdate();
            response.sendRedirect("../mnguser.jsp");
        }catch(Exception e){
            System.out.println(e);
        }

       
    }
%>