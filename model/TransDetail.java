class TransDetail {
    private int transDetailId;
    private int transId;
    private String title;
    private String name;
    private String nationality;

    TransDetail(int transDetailId, int transId, String title, String name, String nationality) {
        this.transDetailId = transDetailId;
        this.transId = transId;
        this.title = title;
        this.name = name;
        this.nationality = nationality;
    }

    /**
     * @return the transDetailId
     */
    public int getTransDetailId() {
        return transDetailId;
    }

    /**
     * @param transDetailId the transDetailId to set
     */
    public void setTransDetailId(int transDetailId) {
        this.transDetailId = transDetailId;
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
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the nationality
     */
    public String getNationality() {
        return nationality;
    }

    /**
     * @param nationality the nationality to set
     */
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

}