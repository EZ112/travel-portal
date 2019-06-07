<%
class Dest {
    private int destId;
    private String destination;

    Dest(int destId, String destination) {
        this.destId = destId;
        this.destination = destination;
    }

    /**
     * @return the destId
     */
    public int getDestId() {
        return destId;
    }

    /**
     * @param destId the destId to set
     */
    public void setDestId(int destId) {
        this.destId = destId;
    }

    /**
     * @return the destination
     */
    public String getDestination() {
        return destination;
    }

    /**
     * @param destination the destination to set
     */
    public void setDestination(String destination) {
        this.destination = destination;
    }

}
%>