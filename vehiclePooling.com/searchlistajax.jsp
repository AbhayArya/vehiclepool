<%@ page import="java.sql.*" %>  
<%  
String source=request.getParameter("val");  
if(source==null||source.trim().equals("")){  
}else{  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Vehiclepool","root","");  
PreparedStatement ps=con.prepareStatement("select source from mastergroup where source like '"+source+"%'");  
ResultSet rs=ps.executeQuery();  
  
if(!rs.isBeforeFirst()) {      
 out.println("<p>No Record Found!</p>");   
}else{  
out.print("<table class="+"col-lg-6 table-bordered"+" border='1' cellpadding='2'>");   
while(rs.next()){  
out.print("<tr><td>"+rs.getString(1)+"</td></tr>");  
}  
out.print("</table></div>");  
}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}//end of else  
%>  