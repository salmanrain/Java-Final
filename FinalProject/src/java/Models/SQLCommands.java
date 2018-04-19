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
public class SQLCommands {

    // this class is the parent class for all the models class(which corespond to all tables in the database)
    public QType qType;
    public CType cType;

    public int ID;

    public SQLCommands() {

    }

    public SQLCommands(int ID, boolean search) {
        this.ID = ID;
        if (search) {
            qType = QType.SEARCH;
        } else {
            qType = QType.DELETE;
        }
    }

    public SQLCommands(int ID, CType cType, boolean search) {
        this(ID, search);
        this.cType = cType;
    }

    public String getOptional1() {
        return String.valueOf(ID);
    }

    public String getOptional2() {
        return "";
    }
}
