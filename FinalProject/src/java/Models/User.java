package Models;

public class User extends SQLCommands{
    
    private String userName;
    public UserType userType;
    public Agent agent = null;
    
    
    
    public User(String userName, UserType userType) {
        this.userName = userName;
        this.userType = userType;
        cType = CType.USER;
        qType = QType.INSERT;
    }
    
    public User(int ID, String userName, UserType userType) {
        this(userName, userType);
        if (ID != -1) {
            this.ID = ID;
            qType = QType.UPDATE;
        }
    }

    public String getUserName() {
        return userName;
    }

    public int getID() {
        return ID;
    }

    public UserType getUserType() {
        return userType;
    }
    
  
    public void setAgent(Agent agent) {
        this.agent = agent;
    }
    
    
        //Auto Quary Builder:
    @Override
    public String getOptional1() {
        if (qType.equals(QType.SEARCH) || qType.equals(QType.DELETE)) {
            return String.valueOf(ID);
        } else if (qType.equals(QType.INSERT)) {
            return "null, '" + userName + "'";
        } else {// type.equals(Qtype.UPDATE)
            return "userName = '" + userName + "'";
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
