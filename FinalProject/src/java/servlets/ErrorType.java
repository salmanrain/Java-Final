package servlets;

public enum ErrorType {
    ERROR404("Error 404 that page doesn't exist, sorry bud"),
    PRIVLEGE_EERROR("You have inccorect privleges.");
    
    private String errorMsg;
    
    private ErrorType(String errorMsg) {
        this.errorMsg = errorMsg;
    }
    
    @Override
    public String toString() {
        return errorMsg;
    }
    
}
