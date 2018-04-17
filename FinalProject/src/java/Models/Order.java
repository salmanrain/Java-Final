
package Models;

import java.sql.Blob;


public class Order extends SQLCommands {
    
    private int agentId;
    private int clientId;
    private int flyerQty;
    private String flyerLayout;
    private Blob flyerImg; 
    private int personalCopy;
    private String paymentInformation;
    private String invoiceNumber;
    private String comments;
    private int isFlyerArtApproved;
    private int isPaymentReceived;
    
    public int getID() {
        return ID;
    }

    public int getAgentId() {
        return agentId;
    }

    public int getClientId() {
        return clientId;
    }

    public int getFlyerQty() {
        return flyerQty;
    }

    public String getFlyerLayout() {
        return flyerLayout;
    }

    public Blob getFlyerImg() {
        return flyerImg;
    }

    public int getPersonalCopy() {
        return personalCopy;
    }

    public String getPaymentInformation() {
        return paymentInformation;
    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public String getComments() {
        return comments;
    }

    public int getIsFlyerArtApproved() {
        return isFlyerArtApproved;
    }

    public int getIsPaymentReceived() {
        return isPaymentReceived;
    }
    
    

    public Order(int agentId, int clientId, int flyerQty, String flyerLayout, Blob flyerImg, int personalCopy, String paymentInformation, String invoiceNumber, String comments, int isFlyerArtApproved, int isPaymentReceived) {
        this.agentId = agentId;
        this.clientId = clientId;
        this.flyerQty = flyerQty;
        this.flyerLayout = flyerLayout;
        this.flyerImg = flyerImg;
        this.personalCopy = personalCopy;
        this.paymentInformation = paymentInformation;
        this.invoiceNumber = invoiceNumber;
        this.comments = comments;
        this.isFlyerArtApproved = isFlyerArtApproved;
        this.isPaymentReceived = isPaymentReceived;
        
        cType = CType.ORDER;
        qType = QType.INSERT;
    }
    
    public Order(int ID, int agentId, int clientId, int flyerQty, String flyerLayout, Blob flyerImg, int personalCopy, String paymentInformation, String invoiceNumber, String comments, int isFlyerArtApproved, int isPaymentReceived) {
        this(agentId, clientId, flyerQty, flyerLayout, flyerImg, personalCopy, paymentInformation, invoiceNumber, comments, isFlyerArtApproved, isPaymentReceived);
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
            return "null, '" + agentId + "', '" + clientId + "', '" + flyerQty + "', '" + flyerLayout + "', '" + flyerImg + "', '" + personalCopy + "', '" + paymentInformation + "', '" + invoiceNumber +"', '" + comments +"', '" + isFlyerArtApproved +"', '" + isPaymentReceived + "'";
        } else {// type.equals(Qtype.UPDATE)
            return "agentId= " + agentId + "', clientId= '" + clientId + "', flyerQty= '" + flyerQty + "', flyerLayout='" + flyerLayout + "', flyerImg= '" + flyerImg + "', personalCopy= '" + personalCopy + "', paymentInformation= '" + paymentInformation + "', invoiceNumber= '" + invoiceNumber +"', comments= '" + comments +"', isFlyerArtApproved= '" + isFlyerArtApproved +"', isPaymentReceived= '" + isPaymentReceived + "'";
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
