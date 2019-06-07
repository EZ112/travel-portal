<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
class Trans{
    private int transId;
    private String invoiceNum;
    private Date purchaseDate;
    private String buyer;
    private String status;

    Trans(int transId, String invoiceNum, Date purchaseDate, String buyer, String status){
        this.transId = transId;
        this.invoiceNum = invoiceNum;
        this.purchaseDate = purchaseDate;
        this.buyer = buyer;
        this.status = status;
    }

    /**
     * @return the transId
     */
    public int getTransId() {
        return transId;
    }

    /**
     * @param transId the transId to set
     */
    public void setTransId(int transId) {
        this.transId = transId;
    }

    /**
     * @return the invoiceNum
     */
    public String getInvoiceNum() {
        return invoiceNum;
    }

    /**
     * @param invoiceNum the invoiceNum to set
     */
    public void setInvoiceNum(String invoiceNum) {
        this.invoiceNum = invoiceNum;
    }

    /**
     * @return the purchaseDate
     */
    public String getPurchaseDate() {
        SimpleDateFormat formatDate = new SimpleDateFormat("dd MMM yyyy");
        String dateString = formatDate.format(purchaseDate);
        return dateString;
    }

    /**
     * @param purchaseDate the purchaseDate to set
     */
    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    /**
     * @return the buyer
     */
    public String getBuyer() {
        return buyer;
    }

    /**
     * @param buyer the buyer to set
     */
    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
}
%>