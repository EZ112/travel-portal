<%@ page import="java.util.Date" %>
<%@ page import="java.util.Random" %>
<%@ include file = "connect.jsp" %>
<%
    String buyerId = request.getParameter("buyerId");
    String fromDest = request.getParameter("fromDest");
    String toDest = request.getParameter("toDest");
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));

    String[] title = request.getParameterValues("title");
    String[] name = request.getParameterValues("name");
    String[] nationality = request.getParameterValues("nationality");

    Date purchaseDate = new Date();
    String date =  purchaseDate.getDate()<10 ? "0"+purchaseDate.getDate() : Integer.toString(purchaseDate.getDate());
    String month = (purchaseDate.getMonth() + 1)<10 ? "0"+(purchaseDate.getMonth() + 1) : Integer.toString((purchaseDate.getMonth() + 1));
    String year = (purchaseDate.getYear() + 1900)<10 ? "0"+(purchaseDate.getYear() + 1900) : Integer.toString((purchaseDate.getYear() + 1900));    

    Random rand = new Random();
    int num = 0;
    String randStr = "";
    for(int i=0; i < 15; i++){
        num = rand.nextInt(10);
        randStr+=Integer.toString(num);
    }

    String invoiceNum = "INV/" + year + month + date+ "/" + randStr;

    String query = "SELECT MAX(TransId) FROM transactions_tbl";
    ResultSet rs = st.executeQuery(query);

    int transId = 0;

    while(rs.next())
         transId = rs.getInt(1);

    PreparedStatement stmt;

    try{
            query = "INSERT INTO transactions_tbl (TransId, InvoiceNum, PurchaseDate, BuyerId, Status) VALUES (?, ?, ?, ?, ?)";
    
            stmt = con.prepareStatement(query);
            stmt.setInt(1, (transId+1));
            stmt.setString(2, invoiceNum);
            stmt.setString(3, year + "-" + month + "-" + date);
            stmt.setString(4, buyerId);
            stmt.setString(5, "Pending");
    
            stmt.executeUpdate();
        }catch(Exception e){
            out.println(e);
        }

        for(int i = 0; i < title.length; i++){
            try{
                query = "INSERT INTO transactionsdetail_tbl (TransId, Title, PersonName, Nationality) VALUES (?, ?, ?, ?)";
        
                stmt = con.prepareStatement(query);
                stmt.setInt(1, (transId+1));
                stmt.setString(2, title[i]);
                stmt.setString(3, name[i]);
                stmt.setString(4, nationality[i]);
        
                stmt.executeUpdate();
        
                response.sendRedirect("../index.jsp");
            }catch(Exception e){
                out.println(e);
            }
        }
%>
