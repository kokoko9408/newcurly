<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="../resources/assets/css/admin/Enroll.css">


  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>

</head>
<body>
<!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
               <!--  <div class="admin_navi_wrap">
                  <ul>
                      <li >
                          <a class="admin_list_01" href="/admin/goodsEnroll" >
                          <img src="/resources/assets/img/main/20.PNG" width = "210px" height="80px"alt="Image">
                           </a>
                      </li>
                      <li>
                          <a class="admin_list_02" href="/admin/goodsManage">상품 관리</a>
                      </li>
                      <lI>
                          <a class="admin_list_03" href="/admin/authorEnroll">회원관리</a>                            
                      </lI>
                      <lI>
                          <a class="admin_list_04" href="/admin/authorManage">작가 관리</a>                            
                      </lI>
                      <lI>
                          <a class="admin_list_05">회원 관리</a>                            
                      </lI>                                                                                             
                  </ul>
                </div> -->
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>회원 관리</span></div>
                    <table>
      <thead>
        <tr>
          <th>번호</th><th>아이디</th><th>이메일</th><th>우편번호</th><th>주소1</th>
          <th>주소2</th><th>등록일</th><th>관리자 유/무</th>
        </tr>
      </thead>
      <c:forEach items ="${list }" var = "member">
      <tbody>
        <tr>
          <td><c:out value = "${member.m_seq}"/></td> 
          <td><c:out value = "${member.m_userid}"/></td><td><c:out value = "${member.m_useremail}"/></td>
          <td><c:out value = "${member. m_zipcode}"/></td>
          <td><c:out value = "${member.m_address}"/></td><td><c:out value = "${member.m_address1}"/></td><td><c:out value = "${member.m_regdate}"/></td><td><c:out value = "${member.m_adminCK}"/></td>
        </tr>
      </tbody>
      </c:forEach>
    </table>
                </div>
          
                <div class="clearfix"></div>
            </div>
</body>
</html>

<%@include file="../includes/footer.jsp"%>