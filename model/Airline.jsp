<%
class Airline {
    private int airlineId;
    private String airline;

    Airline(int airlineId, String airline) {
        this.airlineId = airlineId;
        this.airline = airline;
    }

    /**
     * @return the airlineId
     */
    public int getAirlineId() {
        return airlineId;
    }

    /**
     * @param airlineId the airlineId to set
     */
    public void setAirlineId(int airlineId) {
        this.airlineId = airlineId;
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

}
%>