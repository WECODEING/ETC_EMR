






<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>ͨ��JSP�����ݱ�</title>
</head>
<body>

 <%  
        try {  
            Class.forName("com.mysql.jdbc.Driver");  //����������
            String url = "jdbc:mysql://localhost:3306/web"; //���ݿ���
            String username = "root";  //���ݿ��û���
            String password = "123456";  //���ݿ��û�����
            Connection conn = DriverManager.getConnection(url, username, password);  //����״̬

            if(conn != null){  
                out.print("���ݿ����ӳɹ���");  
                out.print("<br />");            
                Statement stmt = null;  
                ResultSet rs = null;  
                String sql = "SELECT * FROM websites;";  //��ѯ���
                stmt = conn.createStatement();  
                rs = stmt.executeQuery(sql);  
                out.print("��ѯ�����");  
                out.print("<br />");  
                out.println("id"+"  "+"name "+"  "+"url");
                out.print("<br />");  
                while (rs.next()) {  
                 out.println(rs.getInt("id")+"   &nbsp  "+rs.getString("name")+"  &nbsp "+rs.getString("url")); //����ѯ������  
            }  
            }
            else{  
                out.print("����ʧ�ܣ�");  
            }  
        }catch (Exception e) {        
            out.print("���ݿ������쳣��");  
        }  
%>   
</body>
</html>





