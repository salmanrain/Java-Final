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
public class Location extends SQLCommands {

    private String location;
    private int distributionCapacity;

    public Location(String location, int distributionCapacity) {
        this.location = location;
        this.distributionCapacity = distributionCapacity;
        cType = CType.LOCATION;
        qType = QType.INSERT;
    }

    public Location(int ID, String location, int distributionCapacity) {
        this(location, distributionCapacity);
        if (ID != -1) {
            this.ID = ID;
            qType = QType.UPDATE;
        }
    }

    public int getID() {
        return ID;
    }

    public String getLocation() {
        return location;
    }

    public int getDistributionCapacity() {
        return distributionCapacity;
    }

    //Auto Quary Builder:
    @Override
    public String getOptional1() {
        if (qType.equals(QType.SEARCH) || qType.equals(QType.DELETE)) {
            return String.valueOf(ID);
        } else if (qType.equals(QType.INSERT)) {
            return "null, '" + location + "', " + distributionCapacity;
        } else {// type.equals(Qtype.UPDATE)
            return "locationName = '" + location + "', distributionCapacity = " + distributionCapacity;
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
