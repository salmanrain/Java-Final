package Models;

public enum UserType {
        ADMIN, 
        AGENT;
        
        public static UserType getUserType(int type) {
            
            switch(type) {
                case 0:
                    return UserType.ADMIN;
                case 1:
                    return UserType.AGENT;
                default:
                    return null;
            }
        }
}
