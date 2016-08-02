<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
 
<FORM name='frm' 
      method='POST' 
      action='./createProc'>
      
  <TABLE class='table'>
       <tr>  
       <th>기업회원ID</th> 
       <td> 
           <input type="text" name="companyID"> 
           <input type="button" name="confirm"> 
       </td> 
     </tr>  
     <tr>  
       <th>관리자명</th> 
       <td> <input type="text" name="name"> </td> 
     </tr> 
    <tr>  
       <th>패스워드</th> 
       <td> <input type="password" name="passwd" > </td> 
     </tr> 
     <tr>  
       <th>*패스워드 확인</th> 
       <td> <input type="password" name="repasswd" > </td> 
     </tr> 
    
     <tr>  
       <th>전화번호</th> 
       <td><input type="text" name="phone" ></td> 
     </tr> 
         
     <tr>  
       <th>이메일</th> 
       <td> 
           <input type="text" name="email" > 
       </td> 
     </tr> 
     <tr>   
       <th>사업자번호</th> 
              <td> 
           <input type="text" name="companyNumber" >
        
       </td> 

     </tr> 
     
     <tr>   
       <th>회사명</th> 
              <td> 
           <input type="text" name="companyName" >
        
       </td> 

     </tr> 
    
  </TABLE>
  
  
  <DIV class='bottom'>
    <input type='submit' value='회원가입'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>

 

 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 