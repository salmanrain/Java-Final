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
public class LocationXOrders extends SQLCommands{
    
    private int orderId;
    private int agentId;

    public LocationXOrders(int orderId, int agentId) {
        this.orderId = orderId;
        this.agentId = agentId;
        
        cType = CType.LOCATIONXORDER;
        qType = QType.INSERT;
    }
    
    public LocationXOrders(int ID, int orderId, int agentId) {
        this(orderId,agentId);
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
            return "null, '" + orderId + "', '" + agentId + "'";
        } else {// type.equals(Qtype.UPDATE)
            return "orderId = '" + orderId + "', agentId = '" + agentId + "'";
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
