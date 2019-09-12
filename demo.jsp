<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDBC 3-tier example</title>
</head>
<body>
<h1>JDBC 3-tier example</h1>
<%
	String user = "root";
	String pwd = "root";
	try {
		java.sql.Connection con;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a", user, pwd);
		out.println ("Database successfully connected.<br><br>");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from team_members");
		out.print("<h4>Team-01 Members:</h4>");
		while(rs.next())
			out.println(rs.getString(1) + " " + rs.getString(2) + "<br>");
		
		con.close();
	}
	catch(SQLException e) {
		out.println("SQLException caught: " +e.getMessage());
	}
%>

</body>
</html>