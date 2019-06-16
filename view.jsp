<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="css/nav.css">
  <link rel="stylesheet" href="css/template.css">
 <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script type="text/javascript">

function move(url){//링크 누르면 이동하게끔 해주는 함수
	location.href=url;
}
</script>

<title>게시판 글 읽기 페이지</title>
</head>
<body style="height:1500px">
<%@ include file="./nav.jsp" %>
<%

	if(session.getAttribute("userID")!=null){
		userID = (String) session.getAttribute("userID");
	}
	
	int bbsID = 0;
	
	if(request.getParameter("bbsID")!=null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	
	Bbs bbs = new BbsDAO().getBbs(bbsID);
%>

   <!-- 게시판 선택 글 내용 출력 -->


<center>

<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" align = "center">
     <tr text-align:center;">
     <br>
      <td width="5"></td>
      <td align = "center"><h2>게시글 확인</h2></td>
      <td width="5"></td>
     </tr>
</table>

<br>  
   <center>
  <table>   
  
     <tr>
      <td>&nbsp;</td>
      <td style = "width : 20%" align="center">제 목</td>
      <td colspan ="20">&nbsp;<%=bbs.getBbsTitle() %></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">작성자</td>
      <td colspan = "20">&nbsp;<%= bbs.getUserID()%></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>
      
      <tr>
      <td>&nbsp;</td>
      <td align="center">작성일</td>
      <td colspan="20">&nbsp;<%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
					+ bbs.getBbsDate().substring(14, 16) + "분"%></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>
      



    <tr>    
      <td>&nbsp;</td>
      <td align="center">파 일</td> <!-- 파일 불러와서 보여주는 부분 -->
      <td colspan = "20">&nbsp;<%//= bbs.getBbsFile() %></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">내 용</td>
      <td colspan = "20" style = "min-height: 200px; text-align:left;">&nbsp;<%= bbs.getBbsContent() %></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>
     
<!--      <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td>&nbsp;<input type = "password" name = "password" size=20% maxlength="20"></td>
      <td>&nbsp;</td>
     </tr> -->
     
     
     <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>

     <tr height="1" bgcolor="#82B5DF"><td colspan="100"></td></tr>
     
     <tr align="center">
      <td>&nbsp;</td>
      
      </table>
      <table>
      <tr>
      <td colspan="2">
       <a href = "bbs.jsp">목 록</a></td>
       <%
       	if(userID != null && userID.equals(bbs.getUserID())){
       %>       
       <td>	<a href = "modify.jsp?bbsID=<%= bbsID %>">수 정</a></td>
       	<td><a onclick = "return confirm('정말 삭제하시겠습니까?')" href = "delete.jsp?bbsID=<%= bbsID %>">삭 제</a></td>
       
       <%} %>      
		</tr>
		</table>
 
 </center>
 <!-- 댓글 -->
  <p>
    <div id="disqus_thread"></div>
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://aa-disqus-com-1.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
 </p>
 
 
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     

				
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<%@ include file="./footer.jsp" %>
</body>
</html>