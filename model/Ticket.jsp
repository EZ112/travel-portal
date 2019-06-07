<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
class Ticket {
    private int ticketId;
    private String airline;
    private String fromDest;
    private String toDest;
    private int priceEconomy;
    private int priceBusiness;
    private Date departureDate;
    private int availSeat;

    Ticket(int ticketId, String airline, String fromDest, String toDest, int priceEconomy, int priceBusiness,
            Date departureDate, int availSeat) {
        this.ticketId = ticketId;
        this.airline = airline;
        this.fromDest = fromDest;
        this.toDest = toDest;
        this.priceEconomy = priceEconomy;
        this.priceBusiness = priceBusiness;
        this.departureDate = departureDate;
        this.availSeat = availSeat;
    }

    /**
     * @return the ticketId
     */
    public int getTicketId() {
        return ticketId;
    }

    /**
     * @param ticketId the ticketId to set
     */
    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    /**
     * @return the airline
     */
    public String getAirline() {
        return airline;
    }

    /**
     * @param airline the airline to set
     */
    public void setAirline(String airline) {
        this.airline = airline;
    }

    /**
     * @return the fromDest
     */
    public String getFromDest() {
        return fromDest;
    }

    /**
     * @param fromDest the fromDest to set
     */
    public void setFromDest(String fromDest) {
        this.fromDest = fromDest;
    }

    /**
     * @return the toDest
     */
    public String getToDest() {
        return toDest;
    }

    /**
     * @param toDest the toDest to set
     */
    public void setToDest(String toDest) {
        this.toDest = toDest;
    }

    /**
     * @return the priceEconomy
     */
    public int getPriceEconomy() {
        return priceEconomy;
    }

    /**
     * @param priceEconomy the priceEconomy to set
     */
    public void setPriceEconomy(int priceEconomy) {
        this.priceEconomy = priceEconomy;
    }

    /**
     * @return the priceBusiness
     */
    public int getPriceBusiness() {
        return priceBusiness;
    }

    /**
     * @param priceBusiness the priceBusiness to set
     */
    public void setPriceBusiness(int priceBusiness) {
        this.priceBusiness = priceBusiness;
    }

    /**
     * @return the departureDate
     */
    public String getDepartureDate() {
        SimpleDateFormat formatDate = new SimpleDateFormat("dd MMM yyyy");
        String dateString = formatDate.format(departureDate);
        return dateString;
    }

    /**
     * @param departureDate the departureDate to set
     */
    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    /**
     * @return the availSeat
     */
    public int getAvailSeat() {
        return availSeat;
    }

    /**
     * @param availSeat the availSeat to set
     */
    public void setAvailSeat(int availSeat) {
        this.availSeat = availSeat;
    }

}
%>