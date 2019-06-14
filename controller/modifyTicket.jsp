<%@ page import="java.util.Date" %>
<%@ include file = "connect.jsp" %>
<%
    String modifyType = request.getParameter("modifyType");

    if(modifyType.equals("Insert")){
        String airline = request.getParameter("inAirline");
        int fromDestId = Integer.parseInt(request.getParameter("ddlFrom"));
        int toDestId = Integer.parseInt(request.getParameter("ddlTo"));
        int priceEco = Integer.parseInt(request.getParameter("inPriceEco"));
        int priceBus = Integer.parseInt(request.getParameter("inPriceBus"));
        String deptDate = request.getParameter("inDate");
        int availSeat = Integer.parseInt(request.getParameter("inSeat"));

        if(airline.equals(""))
            response.sendRedirect("../mngticket/modify.jsp?err=1");   
        else if(fromDestId == 0)
            response.sendRedirect("../mngticket/modify.jsp?err=2");   
        else if(toDestId == 0)
            response.sendRedirect("../mngticket/modify.jsp?err=3");
        else if(priceEco == 0)
            response.sendRedirect("../mngticket/modify.jsp?err=4");
        else if(priceBus == 0)
            response.sendRedirect("../mngticket/modify.jsp?err=5");
        else if(deptDate.equals(""))
            response.sendRedirect("../mngticket/modify.jsp?err=6");
        else if(availSeat == 0)
            response.sendRedirect("../mngticket/modify.jsp?err=7");
        else{
                try{
                    String query = "INSERT INTO tickets_tbl(Airline, FromDestId, ToDestId, PriceEconomy, PriceBusiness, DepartureDate, AvailSeat) VALUES (?,?,?,?,?,?,?)";

                    PreparedStatement stmt = con.prepareStatement(query);
                    stmt.setString(1, airline);
                    stmt.setInt(2, fromDestId);
                    stmt.setInt(3, toDestId);
                    stmt.setInt(4, priceEco);
                    stmt.setInt(5, priceBus);
                    stmt.setString(6, deptDate);
                    stmt.setInt(7, availSeat);

                    stmt.executeUpdate();

                    response.sendRedirect("../mngticket.jsp");
                }catch(Exception e){
                    out.println(e);
                }
        }
        
    }
    else if(modifyType.equals("Update")){
        try{
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            String airline = request.getParameter("inAirline");
            int fromDestId = Integer.parseInt(request.getParameter("ddlFrom"));
            int toDestId = Integer.parseInt(request.getParameter("ddlTo"));
            int priceEco = Integer.parseInt(request.getParameter("inPriceEco"));
            int priceBus = Integer.parseInt(request.getParameter("inPriceBus"));
            String deptDate = request.getParameter("inDate");
            int availSeat = Integer.parseInt(request.getParameter("inSeat"));
            
            

            String query = "UPDATE tickets_tbl SET Airline = ?, FromDestId = ?, ToDestId = ?, PriceEconomy = ?, PriceBusiness = ?, DepartureDate = ?, AvailSeat = ? WHERE TicketId = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, airline);
            stmt.setInt(2, fromDestId);
            stmt.setInt(3, toDestId);
            stmt.setInt(4, priceEco);
            stmt.setInt(5, priceBus);
            stmt.setString(6, deptDate);
            stmt.setInt(7, availSeat);
            stmt.setInt(8, ticketId);
            stmt.executeUpdate();

            response.sendRedirect("../mngticket.jsp");
        }catch(Exception e){
            System.out.println(e);
        }
    }
    else if(modifyType.equals("Delete")){
        int ticketId = Integer.parseInt(request.getParameter("ticketId"));

        try{
            String query = "DELETE FROM tickets_tbl WHERE TicketId = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, ticketId);
            stmt.executeUpdate();
            response.sendRedirect("../mngticket.jsp");
        }catch(Exception e){
            System.out.println(e);
        }

       
    }
%>