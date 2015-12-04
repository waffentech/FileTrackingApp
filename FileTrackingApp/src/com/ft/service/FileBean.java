package com.ft.service;

import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
import java.util.logging.*;

import com.ft.model.File;

//...import statements

public class FileBean {
	 
	    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	    private static final String DATABASE_URL = "jdbc:mysql://localhost/file_mgmt";
	    private static final String USERNAME = "root";
	    private static final String PASSWORD = "";
	 
	    public void addNew(File e) {
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        try {
	            Class.forName(JDBC_DRIVER);
	            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
	            pstmt = con.prepareStatement("INSERT INTO file_details(file_name, file_no, file_type, description, owner_dept, owner_sec, owner,from_section, from_user, to_section, to_user, priority, created_date, due_date, tags, remarks) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	            pstmt.setString(1, e.getFile_name());
	            pstmt.setString(2, e.getFile_no());
	            pstmt.setString(3, e.getFile_type());
	            pstmt.setString(4, e.getDescription());
	            pstmt.setInt(5, e.getOwner_dept());
	            pstmt.setInt(6, e.getOwner_sec());
	            pstmt.setInt(7, e.getOwner());
	            pstmt.setInt(8, e.getFrom_section());
	            pstmt.setInt(9, e.getFrom_user());
	            pstmt.setInt(10, e.getTo_section());
	            pstmt.setInt(11, e.getTo_user());
	            pstmt.setInt(12, e.getPriority());
	            pstmt.setDate(13, e.getCreated_date());
	            pstmt.setDate(14, (Date) e.getDue_date());
	            pstmt.setString(15, e.getTags());
	            pstmt.setString(16, e.getRemarks());
	            pstmt.execute();
//	            con.commit();
	        } catch (SQLException | ClassNotFoundException ex) {
                ex.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) {
	                    pstmt.close();
	                }
	                if (con != null) {
	                    con.close();
	                }
	            } catch (SQLException ex) {
	                Logger.getLogger(FileBean.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	    }
	 
//	    public void delete(int id) {
//	        Connection con = null;
//	        Statement stmt = null;
//	        try {
//	            Class.forName(JDBC_DRIVER);
//	            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
//	            stmt = con.createStatement();
//	            stmt.execute("DELETE FROM file_details WHERE file_id=" + String.valueOf(id));
//	        } catch (SQLException | ClassNotFoundException ex) {
//	 
//	        } finally {
//	            try {
//	                if (stmt != null) {
//	                    stmt.close();
//	                }
//	                if (con != null) {
//	                    con.close();
//	                }
//	            } catch (SQLException ex) {
//	                Logger.getLogger(FileBean.class.getName()).log(Level.SEVERE, null, ex);
//	            }
//	        }
//	    }
	 
//	    public void update(File e) {
//	        Connection con = null;
//	        PreparedStatement pstmt = null;
//	        try {
//	            Class.forName(JDBC_DRIVER);
//	            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
//	            pstmt = con.prepareStatement("UPDATE file_details SET file_name=?, instance_id=? WHERE file_id=?");
//	            pstmt.setString(1, e.getFile_name());
//	            pstmt.setInt(2, e.getInstance_id());
//	            pstmt.setInt(3, e.getFile_id());
//	            pstmt.executeUpdate();
//	        } catch (SQLException | ClassNotFoundException ex) {
//	 
//	        } finally {
//	            try {
//	                if (pstmt != null) {
//	                    pstmt.close();
//	                }
//	                if (con != null) {
//	                    con.close();
//	                }
//	            } catch (SQLException ex) {
//	                Logger.getLogger(FileBean.class.getName()).log(Level.SEVERE, null, ex);
//	            }
//	        }
//	    }
	 
//	    public File getFile(int id) {
//	        File file = null;
//	        Connection con = null;
//	        Statement stmt = null;
//	        try {
//	            Class.forName(JDBC_DRIVER);
//	            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
//	            stmt = con.createStatement();
//	            ResultSet rs = stmt.executeQuery("SELECT file_id, file_name, instance_id FROM file_details WHERE file_id=" + id);
//	            if (rs.next()) {
//	                file = new File();
//	                file.setFile_id(rs.getInt(1));
//	                file.setFile_name(rs.getString(2));
//	                file.setInstance_id(rs.getInt(3));
//	            }
//	        } catch (SQLException | ClassNotFoundException ex) {
//	 
//	        } finally {
//	            try {
//	                if (stmt != null) {
//	                    stmt.close();
//	                }
//	                if (con != null) {
//	                    con.close();
//	                }
//	            } catch (SQLException ex) {
//	                Logger.getLogger(FileBean.class.getName()).log(Level.SEVERE, null, ex);
//	            }
//	        }
//	        return file;
//	    }
	 
//	    public List<File> getFiles() {
//	        List<File> list = new ArrayList<>();
//	        Connection con = null;
//	        Statement stmt = null;
//	        try {
//	            Class.forName(JDBC_DRIVER);
//	            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
//	            stmt = con.createStatement();
//	            ResultSet rs = stmt.executeQuery("SELECT file_id, file_name, file_no, file_type, description, owner_dept, owner_sec, owner, from_user, to_user, from_section, to_section, priority, created_date, status, workflow_id, completed_date, due_date, is_active, barcode_string, tags, remarks, forwarded_date, received_date FROM file_details ORDER BY created_date desc");
//	            while (rs.next()) {
//	                File file = new File();
//	                file.setFile_id(rs.getInt(1));
//	                file.setFile_name(rs.getString(2));
//	                file.setFile_no(rs.getString(3));
//	                file.setFile_type(rs.getString(4));
//	                file.setDescription(rs.getString(5));
//	                file.setOwner_dept(rs.getInt(6));
//	                file.setOwner_sec(rs.getInt(7));
//	                file.setOwner(rs.getInt(8));
//	                file.setFrom_user(rs.getInt(9));
//	                file.setTo_user(rs.getInt(10));
//	                file.setFrom_section(rs.getInt(11));
//	                file.setTo_section(rs.getInt(12));
//	                file.setPriority(rs.getInt(13));
//	                file.setCreated_date(rs.getDate(14));
//	                file.setStatus(rs.getInt(15));
//	                file.setWorkflow_id(rs.getInt(16));
//	                file.setCompleted_date(rs.getDate(17));
//	                file.setDue_date(rs.getDate(18));
//	                file.setIs_active(rs.getString(19));
//	                file.setBarcode_string(rs.getString(20));
//	                file.setTags(rs.getString(21));
//	                file.setRemarks(rs.getString(22));
//	                file.setForwarded_date(rs.getDate(23));
//	                file.setReceived_date(rs.getDate(24));
//
//	                list.add(file);
//	            }
//	        } catch (SQLException | ClassNotFoundException ex) {
//	 
//	        } finally {
//	            try {
//	                if (stmt != null) {
//	                    stmt.close();
//	                }
//	                if (con != null) {
//	                    con.close();
//	                }
//	            } catch (SQLException ex) {
//	                
//	            }
//	        }
//	        return list;
//	    }
}
