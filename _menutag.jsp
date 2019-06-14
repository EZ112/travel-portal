<%
    String name = (String)session.getAttribute("name");
    if(name != null){
        out.println("<div class='menu'><a href='index.jsp'>Home</a></div>");
        out.println("<div class='user'><a href=''>Track Order</a><span>"+name+"<div class='ddlUser'><a href='controller/doSignout.jsp'>Sign Out</a></div></span></div>");
    }
    else{
        out.println("<div class='tagline'>The easiest way to find cheapest ticket</div>");
        out.println("<div class='user'><a href='signin.jsp'>Sign in</a><a href='signup.jsp'>Register</a></div>");
    }
%>