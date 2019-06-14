<%
        String name = (String)session.getAttribute("name");
%>
<div class="menu"> 
    <a href='index.jsp'>Home</a>
    <a href='mnguser.jsp'>Users</a>
    <a href='mngcity.jsp'>Cities</a>
    <a href='mngticket.jsp'>Ticket</a>
    <a href='mngtrans.jsp'>Transaction</a>
</div>
<div class='user'>
    <span>
        <%= name%>
        <div class='ddlUser'>
            <a href='controller/doSignout.jsp'>Sign Out</a>
        </div>
    </span>
</div>