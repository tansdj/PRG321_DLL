/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bc_stationary_dll;

/**
 *
 * @author Tanya
 */
public class Datahelper {
    public static String selectPerson = "SELECT * FROM `tblperson` INNER JOIN `tbladdress` ON `AddressIDFK`=`AddressIDPK`\n" +
                                 "INNER JOIN `tblcontact` ON `ContactIDPK` = `ContactIDFK` INNER JOIN `tblDepartment` ON `DepIDFK` = `DepartmentIDPK`";
    public static String specificPerson(String id){
        return "SELECT * FROM `tblperson` INNER JOIN `tbladdress` ON `AddressIDFK`=`AddressIDPK`\n" +
                    "INNER JOIN `tblcontact` ON `ContactIDPK` = `ContactIDFK` INNER JOIN `tblDepartment` ON `DepIDFK` = `DepartmentIDPK` WHERE `IDNumber` = '"+id+"'";
    }
    public static String selectUser = "SELECT * FROM `tblUser` INNER JOIN `tblPerson` ON `PersonIDFK` = `PersonIDPK`";
    
    public static String pendingUser = "SELECT * FROM `tblUser` INNER JOIN `tblPerson` ON `PersonIDFK` = `PersonIDPK`  AND `Status`= 'Pending'";
    
    public static String specificUser(String username){
        return "SELECT * FROM `tblUser` INNER JOIN `tblPerson` ON `PersonIDFK` = `PersonIDPK` WHERE `Username` = '"+username+"'";
    }
    
    public static String selectUQuestions = "SELECT * FROM `tblusersecurityquestions` INNER JOIN `tbluser` ON `UserIDFK` = `UserIDPK` "
                                            + "INNER JOIN `tblsecurityquestions` ON `QuestionIDFK` = `QuestionIDPK`";
    public static String specificUQuestions(String username){
        return "SELECT * FROM `tblusersecurityquestions` INNER JOIN `tbluser` ON `UserIDFK` = `UserIDPK` "
                    + "                        INNER JOIN `tblsecurityquestions` ON `QuestionIDFK` = `QuestionIDPK` WHERE `Username` = '"+username+"'";
    }
    
    public static String selectProducts = "SELECT * FROM `tblproduct` INNER JOIN `tblmodel` ON `ModelIDFK` = `ModelIDPK` INNER JOIN `tblcategory` ON `CategoryIDFK` = `CategoryIDPK`";
    
    public static String specificProduct(String productName){
        return "SELECT * FROM `tblproduct` INNER JOIN `tblmodel` ON `ModelIDFK` = `ModelIDPK` INNER JOIN `tblcategory` ON `CategoryIDFK` = `CategoryIDPK` WHERE `Name` = '"+productName+"'";
    }
    
    public static String selectStock = "SELECT * FROM `tblstock` INNER JOIN `tblproduct` ON `ProductIDFK` = `ProductIDPK`";
    
    public static String specificStock(String productName){
        return "SELECT * FROM `tblstock` INNER JOIN `tblproduct` ON `ProductIDFK` = `ProductIDPK` WHERE `Name` = '"+productName+"'";
    }
    
    public static String selectRequest = "SELECT * FROM `tbluserrequest` INNER JOIN `tbluser` ON `UserIDFK` = `UserIDPK` INNER JOIN `tblproduct` ON `ProductIDFK` = `ProductIDPK`";
    
    
    
}
