package com.ft.service;

//...import statements

public class UserBean {

		 
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DATABASE_URL = "jdbc:mysql://localhost/file_mgmt";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
		 
		    public void addNew(Employee e) {
		        Connection con = null;
		        PreparedStatement pstmt = null;
		        try {
		            Class.forName(JDBC_DRIVER);
		            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
		            pstmt = con.prepareStatement("INSERT INTO emp(empId,empName,phone,email,salary,desig) VALUES(?,?,?,?,?,?)");
		            pstmt.setInt(1, e.getEmpId());
		            pstmt.setString(2, e.getName());
		            pstmt.setString(3, e.getPhone());
		            pstmt.setString(4, e.getEmail());
		            pstmt.setFloat(5, e.getSalary());
		            pstmt.setString(6, e.getDesignation());
		            pstmt.execute();
		        } catch (SQLException | ClassNotFoundException ex) {
		 
		        } finally {
		            try {
		                if (pstmt != null) {
		                    pstmt.close();
		                }
		                if (con != null) {
		                    con.close();
		                }
		            } catch (SQLException ex) {
		                Logger.getLogger(EmployeeBean.class.getName()).log(Level.SEVERE, null, ex);
		            }
		        }
		    }
		 
		    public void delete(int id) {
		        Connection con = null;
		        Statement stmt = null;
		        try {
		            Class.forName(JDBC_DRIVER);
		            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
		            stmt = con.createStatement();
		            stmt.execute("DELETE FROM emp WHERE empId=" + String.valueOf(id));
		        } catch (SQLException | ClassNotFoundException ex) {
		 
		        } finally {
		            try {
		                if (stmt != null) {
		                    stmt.close();
		                }
		                if (con != null) {
		                    con.close();
		                }
		            } catch (SQLException ex) {
		                Logger.getLogger(EmployeeBean.class.getName()).log(Level.SEVERE, null, ex);
		            }
		        }
		    }
		 
		    public void update(Employee e) {
		        Connection con = null;
		        PreparedStatement pstmt = null;
		        try {
		            Class.forName(JDBC_DRIVER);
		            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
		            pstmt = con.prepareStatement("UPDATE emp SET empName=?, phone=?, email=?, salary=?, desig=? WHERE empId=?");
		            pstmt.setString(1, e.getName());
		            pstmt.setString(2, e.getPhone());
		            pstmt.setString(3, e.getEmail());
		            pstmt.setFloat(4, e.getSalary());
		            pstmt.setString(5, e.getDesignation());
		            pstmt.setInt(6, e.getEmpId());
		            pstmt.executeUpdate();
		        } catch (SQLException | ClassNotFoundException ex) {
		 
		        } finally {
		            try {
		                if (pstmt != null) {
		                    pstmt.close();
		                }
		                if (con != null) {
		                    con.close();
		                }
		            } catch (SQLException ex) {
		                Logger.getLogger(EmployeeBean.class.getName()).log(Level.SEVERE, null, ex);
		            }
		        }
		    }
		 
		    public Employee getEmployee(int id) {
		        Employee emp = null;
		        Connection con = null;
		        Statement stmt = null;
		        try {
		            Class.forName(JDBC_DRIVER);
		            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
		            stmt = con.createStatement();
		            ResultSet rs = stmt.executeQuery("SELECT * FROM emp WHERE empId=" + id);
		            if (rs.next()) {
		                emp = new Employee();
		                emp.setEmpId(rs.getInt(1));
		                emp.setName(rs.getString(2));
		                emp.setPhone(rs.getString(3));
		                emp.setEmail(rs.getString(4));
		                emp.setSalary(rs.getFloat(5));
		                emp.setDesignation(rs.getString(6));
		            }
		        } catch (SQLException | ClassNotFoundException ex) {
		 
		        } finally {
		            try {
		                if (stmt != null) {
		                    stmt.close();
		                }
		                if (con != null) {
		                    con.close();
		                }
		            } catch (SQLException ex) {
		                Logger.getLogger(EmployeeBean.class.getName()).log(Level.SEVERE, null, ex);
		            }
		        }
		        return emp;
		    }
		 
		    public List<Employee> getEmployees() {
		        List<Employee> list = new ArrayList<>();
		        Connection con = null;
		        Statement stmt = null;
		        try {
		            Class.forName(JDBC_DRIVER);
		            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
		            stmt = con.createStatement();
		            ResultSet rs = stmt.executeQuery("SELECT * FROM emp ORDER BY empId");
		            while (rs.next()) {
		                Employee emp = new Employee();
		                emp.setEmpId(rs.getInt(1));
		                emp.setName(rs.getString(2));
		                emp.setPhone(rs.getString(3));
		                emp.setEmail(rs.getString(4));
		                emp.setSalary(rs.getFloat(5));
		                emp.setDesignation(rs.getString(6));
		                list.add(emp);
		            }
		        } catch (SQLException | ClassNotFoundException ex) {
		 
		        } finally {
		            try {
		                if (stmt != null) {
		                    stmt.close();
		                }
		                if (con != null) {
		                    con.close();
		                }
		            } catch (SQLException ex) {
		                
		            }
		        }
		        return list;
		    }
}
