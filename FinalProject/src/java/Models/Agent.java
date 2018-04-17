package Models;

public class Agent extends SQLCommands{
    
    private String firstName;
    private String lastName;
    private String phoneNo;
    private String email;
    
    public int getID() {
        return ID;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public String getEmail() {
        return email;
    }
    
    
    public Agent(String firstName, String lastName, String phoneNum, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNo = phoneNum;
        this.email = email;
        cType = CType.AGENT;
        qType = QType.INSERT;
    }

    public Agent(int ID, String firstName, String lastName, String phoneNum, String email) {
        this(firstName, lastName, phoneNum, email);
        if (ID != -1) {
            this.ID = ID;
            qType = QType.UPDATE;
        }
    }
    
    //Auto Quary Builder:
    @Override
    public String getOptional1() {
        if (qType.equals(QType.SEARCH) || qType.equals(QType.DELETE)) {
            return String.valueOf(ID);
        } else if (qType.equals(QType.INSERT)) {
            return "null, '" + firstName + "', '" + lastName + "', '" + phoneNo + "', '" + email + "'";
        } else {// type.equals(Qtype.UPDATE)
            return "firstName = '" + firstName + "', lastName = '" + lastName + "', phoneNo = '" + phoneNo + "', email = '" + email + "'";
        }
    }

    @Override
    public String getOptional2() {
        if (qType.equals(QType.SEARCH) || qType.equals(QType.DELETE) || qType.equals(QType.INSERT)) {
            return "";
        }
        return String.valueOf(ID);
    }
}
