/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author User
 */
public class Client extends SQLCommands {
    
    private String firstName;
    private String lastName;
    private int streetNumber;
    private String streetName;
    private String city;
    private String province;
    private String postalCode;
    private String telOffice;
    private String telCell;
    private String email;
    private String company;
    private String companyType;

    public Client(String firstName, String lastName, int streetNumber, String streetName, String city, String province, String postalCode, String telOffice, String telCell, String email, String company, String companyType) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.streetNumber = streetNumber;
        this.streetName = streetName;
        this.city = city;
        this.province = province;
        this.postalCode = postalCode;
        this.telOffice = telOffice;
        this.telCell = telCell;
        this.email = email;
        this.company = company;
        this.companyType = companyType;
        cType = CType.CLIENT;
        qType = QType.INSERT;
    }
    
    

    public Client(int ID, String firstName, String lastName, int streetNumber, String streetName, String city, String province, String postalCode, String telOffice, String telCell, String email, String company, String companyType) {
        this(firstName, lastName, streetNumber, streetName, city, province, postalCode, telOffice, telCell, email, company, companyType);
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
            return "null, '" + firstName + "', '" + lastName + "', " + streetNumber + ", '" + streetName + "', '" + city + "', '" + province + "', '" + postalCode + "', '" + telOffice + "', '" + telCell + "', '" + email + "', '" + company + "', '" + companyType + "'";
        } else {// type.equals(Qtype.UPDATE)
            return "firstName = '" + firstName + "', lastName='" + lastName + "', streetNumber= " + streetNumber + ", streetName= '" + streetName + "', city= '" + city + "', province= '" + province + "', postalCode= '" + postalCode + "', telOffice= '" + telOffice + "', telCell= '" + telCell + "', email= '" + email + "', company= '" + company + "', companyType= '" + companyType + "'";
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
