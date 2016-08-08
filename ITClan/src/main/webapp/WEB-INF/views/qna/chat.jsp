 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="uti" uri="/ELFunctions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
        .container { width: 600px; padding: 10px; border: 2px solid #3e3e41;}
        .talk_view { position: relative; width: 580px; height: 200px; padding: 5px; border: 1px dotted #3e3e41; overflow-y:scroll;}
        .talk_input { position: relative; margin-top: 20px; width: 500px; padding: 5px; border: 1px dotted #3e3e41; }
    </style>
    <script language="javascript" type="text/javascript">
        var thisUserId = "Marbong"; // 아이디입력
		
//         var thisUserId = ${sessionScope.memberID}; // 아이디입력
       
        // 텍스트에 박스에 입력한 대화내용을 서버에 전송한다.
        function sendTalk() {
            var obj = document.getElementById("talk_input");
            if(obj) {
                
                addTalk(obj.value);  //대회내용을 추가한다.
                obj.value = ""; //텍스트필드 초기화
                obj.focus();  //커서를 텍스트필드에 위치한다.
            }
        }
       
        // 입력된 대화 내용을 대화창에 추가한다.
        function addTalk(content) {
            var obj = document.getElementById("talk_view");
            if(obj) {
                var line = thisUserId + " - " + content + "<br>";  //이름 -내용을 저장
                obj.innerHTML += line;  //내용을 추가한다.
            }          
        }
    </script>
</head>
 <body>
        <div class="container">
            <div id="talk_view" class="talk_view"></div>   
            <input type="text" name="talk_input" id="talk_input" class="talk_input">
            <input type="button" name="talk_send" id="talk_send" value="입력" OnClick="sendTalk()">
        </div>
    </body>
</html>