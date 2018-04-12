package Models;

public enum CType {
    // This class is meant to keep all the table names for Read, Insert, Update, Delete
    LOCATION("location"),
    USER("user"),
    AGENT("marketingagent"),
    CLIENT("clients"),
    ORDER("orders"),
    LOCATIONXORDER("locationxorders");
    

    private final String tableName;
    
    public String getTable() {
        return tableName;
    }
    
    public static CType getCType(String type) {
        switch(type) {
            case "Location" :
                return CType.LOCATION;
            default:
                return null;
        }
    }

    private CType(String tableName) {
        this.tableName = tableName;
    }
}
