<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터 - 1:1 문의</title>
</head>
<script language="Javascript">

function checkemailaddy(){
        if (form.email_select.value == '1') {
            form.mail.readonly = false;
            form.mail.value = '';
            form.mail.focus();
        }
        else {
            form.mail.readonly = true;
            form.mail.value = form.email_select.value;
        }
    }

</script>
<body>
<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>
<fieldset>

		
			<legend>1:1 고객상담</legend>
			<div class="mbrSec mbrCC">
				<h2 class="mbrHeading2"><img src="../img/dot.gif" alt="1:1 고객상담"></h2>
<!-- 				<div class="mbrTplDesc"> -->
					<p>서비스 이용 중 궁금하신 사항에 대해서 문의해 주세요.</p>
<!-- 				</div> -->
				<p class="notice"><img  src="../img/dot.gif"> 필수 입력사항</p>
		<div class="mbrTplData2">
				<FORM name='form' method='POST' action='./create'
					enctype='multipart/form-data' onsubmit="return inputCheck(this)">
				
					<table>
					
						<caption><span class="skip">1:1 고객상담 입력폼</span></caption>
						<tbody>		
					
						<tr>
							<th scope="row"><label for="Member_ID"><img alt="필수입력사항" src="../img/dot.gif"> 아이디</label></th>
							<td>
								<div class="mbrHelpWrap">		
									<%String id =(String)session.getAttribute("memberID");%>
<%-- 									 ${sessionScope.memberID} --%>
									<input type="text" id="Member_ID" name="id" maxlength="20" 
											style="width:200px;" class="ipText" value="<%=id%>" readonly />
								
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="Email_ID"><img alt="필수입력사항" src="../img/dot.gif"> 전송받을 e-메일</label></th>
							<td>
								<div class="mbrHelpWrap">

										
									
										<input name="mail" type="text" class="box" id="mail2" size="40">
										<select name="email_select" class="box" id="email_select" onChange="checkemailaddy();">
										    <option value="" selected>선택하세요</option>
										    <option value="@naver.com">naver.com</option>
										    <option value="@gmail.com">gmail.com</option>
										    <option value="@nate.com">nate.com</option>
										    <option value="@hanmail.com">hanmail.com</option>
										    <option value="@hotmail.com">hotmail.com</option>
										    <option value="@yahoo.co.kr">yahoo.co.kr</option>
										    <option value="1">직접입력</option>
										</select>
										  
										
									<div style="left:535px; display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp">
										<div class="desc">
											<p>e-메일 주소를 입력해 주세요.</p>
										</div>
										<span class="arrow"></span>
									</div>		
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="Mail_Title"><img alt="필수입력사항" src="../img/dot.gif"> 제목</label></th>
							<td>
								<div class="mbrHelpWrap">		
									<input type="text" id="Mail_Title" name="title" maxlength="50" style="width:342px;" class="ipText">
									<div style="left:358px; display:none;" class="mbrTplLayer mbrTplLayer_1 mbrLayerHelp">
										<div class="desc">
											<p>제목을 입력해 주세요.</p>
										</div>
										<span class="arrow"></span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="Mail_Content"><img alt="필수입력사항" src="../img/dot.gif"> 내용</label></th>
							<td>
								<div class="mbrHelpWrap">		
									<textarea id="Mail_Content" name="content" style="width: 600px; margin-top: 0px; margin-bottom: 0px; height: 170px;" rows="5" class="ipTextarea"></textarea>
								
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="lb_up_file2"><span class="blank"></span>파일첨부</label></th>
							<td>
<!-- 							 class="mbrUploadTpl" -->
								<div>									
									<input type='file' name="filenameMF">
									<p class="assist">(<em>3MB</em> 이내의 doc, docx, hwp, ppt, pptx, xls, xlsx, pdf, zip, jpg, gif 가능)</p>
								</div>
							</td>
						</tr>
					</tbody></table>
					
					
				

				<!--// 첨부파일 등록 팝업 -->
<!-- 				<div class="popFileAttach" id="devAddFileView" name="devAddFileView" style="position:absolute; left:50%; top:50%; margin:-188px 0 0 -235px; z-index:999999; display:none;"> -->
<!-- 					<iframe id="devAddFileViewIfrm" name="devAddFileViewIfrm" width="470" height="377" frameborder="0" scrolling="no" allowtransparency="true" title="첨부파일 등록"></iframe> -->
<!-- 				</div> -->


				<hr>
				<p class="mbrBtnFunc">
				  		<span class="mbrBtn mbrBtnOk_4"> <input type='submit' value='접수하기'></span>
    					<input type='button' value='취소' onclick="history.back();"> 
					
				</p>
				</form>
				</div>
			</div>
			<hr>
			</fieldset>
			



</body>
</html>