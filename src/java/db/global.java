/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.sql.DriverManager;

/**
 *
 * @author Puru
 */
public class global {
Connection con ; 
Statement stmt ; 
int i=0;
public global(){
    try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/learnify";
    con = DriverManager.getConnection(url, "root", "root") ; 
    stmt = con.createStatement() ; 
       // System.out.println("workng");
    }catch(Exception e){
        System.out.println(e);
    }
}
public void update(String qry)throws Exception{
    stmt.executeUpdate(qry) ; 
    
}
public ResultSet execute(String qry)throws Exception{
    ResultSet rs = stmt.executeQuery(qry) ; 
    return rs ;
}

public int autoid(String table , String column)throws Exception{
    String qry = "select ifnull(max("+column+") , 0) from "+table+"; " ;
    System.out.println(qry);
    ResultSet rs = new db.global().execute(qry) ; 
    rs.next();
    System.out.println(rs.getInt("ifnull(max("+column+") , 0)"));
    if((rs.getInt("ifnull(max("+column+") , 0)"))==0){
        i=  1 ;
    }else{
        i=rs.getInt("ifnull(max("+column+") , 0)") ;
        i++;
        
    }
    System.out.println(i);
    return i ;
}
    }
