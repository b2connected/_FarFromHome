<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "notice.Notice" %>
<%@ page import = "notice.NoticeDAO" %>

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
<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String) session.getAttribute("userID");
	}
	
	int noticeID = 0;
	
	if(request.getParameter("noticeID")!=null){
		noticeID = Integer.parseInt(request.getParameter("noticeID"));
	}
	
	if (noticeID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'notice.jsp'");
		script.println("</script>");
	}
	Notice notice = new NoticeDAO().getNotice(noticeID);
%>

<!-- userID 값이 없으면 상단 메뉴바에 로그인과 회원가입만 출력된다-->
<% if(userID == null){
%>
<div class="topnav">
	<a class="active" href="index.jsp" >FarFromHome</a>
		<div class="topnav-right">
	   		<a class="nav-link active" href="login.jsp">로그인</a>
        	<a class="nav-link active" href="join.jsp">회원가입</a>
       <!--	<a class="nav-link active" href="toGoList.jsp">마이페이지</a>	-->
		</div>
</div>

<!-- userID 값이 있으면 로그인이 되어있음 -->

<%}else{ %>
<div class="topnav">
	<a class="active" href="index.jsp" >FarFromHome</a>
		<div class="topnav-right">
	   		<a class="nav-link active" href="logout.jsp">로그아웃</a> <!-- 로그인을 한 후에는 로그아웃을 하게끔. 로그아웃을 누르면 null 값으로 바뀌며 메인 페이지로 이동하게 한다. -->
        <!--	<a class="nav-link active" href="join.jsp">회원가입</a> -->
       		<a class="nav-link active" href="toGoList.jsp">마이페이지</a>
		</div>
</div>
<%} %>

<!-- 이어서 nav부분 -->

<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed " >
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	게시판
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="faq.jsp">공지사항</a>
          <a class="dropdown-item" href="bbs.jsp">여행정보</a>
        </div>
      </li>  
      <li class="nav-item">
        <a class="nav-link" href="info.jsp">여행정보 검색</a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	고객 서비스
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Qna.jsp">Q/A</a>
          <a class="dropdown-item" href="Report.jsp">1:1 신고</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="guide.jsp">사이트 이용안내</a>
      </li>
    </ul>
  </div>
</nav>

<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="text-align:center">
      <td>내 용</td>
     </tr>
    </table>

   <!-- 공지사항 선택 글 내용 출력 -->
	<!-- 파일 내용 작성 부분 ! warning이 뜨긴하는데 이유는 center 태그 때문인듯 하다.  -->


<center>

<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" align = "center">
     <tr text-align:center;">
     <br>
      <td width="5"></td>
      <td align = "center"><h2>공지사항 확인</h2></td>
      <td width="5"></td>
     </tr>
</table>

<br>  
   
  <table>   
  
     <tr>
      <td>&nbsp;</td>
      <td style = "width : 20%" align="center">제 목</td>
      <td colspan ="20">&nbsp;<%=notice.getNoticeTitle() %></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">작성자</td>
      <td colspan = "20">&nbsp;<%= notice.getUserID()%></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>
      
      <tr>
      <td>&nbsp;</td>
      <td align="center">작성일</td>
      <td colspan="20">&nbsp;<%= notice.getNoticeDate().substring(0, 11) + notice.getNoticeDate().substring(11, 13) + "시"
					+ notice.getNoticeDate().substring(14, 16) + "분"%></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>
      



    <tr>    
      <td>&nbsp;</td>
      <td align="center">파 일</td> <!-- 파일 불러와서 보여주는 부분 -->
      <td colspan = "20">&nbsp;<%//= notice.getNoticeFile() %></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="100"></td></tr>
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">내 용</td>
      <td colspan = "20" style = "min-height: 200px; text-align:left;">&nbsp;<%= notice.getNoticeContent() %></td>
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
       <a href = "faq.jsp">목 록</a></td>
       <%
       	if(userID != null && userID.equals(notice.getUserID())){
       %>       
       <td>	<a href = "modifynotice.jsp?noticeID=<%= noticeID %>">수 정</a></td>
       	<td><a onclick = "return confirm('정말 삭제하시겠습니까?')" href = "deletenotice.jsp?noticeID=<%= noticeID %>">삭 제</a></td>
       
       <%} %>      
		</tr>
		</table>
 
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
 </center>
</body>
</html>