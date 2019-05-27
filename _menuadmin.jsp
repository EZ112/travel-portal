<%!
        String homeLink = "index.jsp";
        String userLink = "mnguser.jsp";
        String citiesLink = "mngcities.jsp";
        String ticketLink = "mngticket.jsp";
        String transLink = "mngtrans.jsp";
%>
<%
        String name = (String)session.getAttribute("name");
%>
<div class="menu"> 
    <a href=<%= homeLink%>>Home</a>
    <a href=<%= userLink%>>Users</a>
    <a href=<%= citiesLink%>>Cities</a>
    <a href=<%= ticketLink%>>Ticket</a>
    <a href=<%= transLink%>>Transaction</a>
</div>
<div class='user'>
    <span>
        <%= name%>
        <div class='ddlUser'>
            <a href='controller/doSignout.jsp'>Sign Out</a>
        </div>
    </span>
</div>