<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

</head> 

<body>

 
 
<FORM name='frm' 
      method='POST' 
      action='./createProc'
      >
      
  <TABLE class='table'>
       <tr>  
       <th>기업회원ID</th> 
       <td> 
           <input type="text" name="companyID"> 
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
           <input type="number" name="companyNumber" >
        
       </td> 

     </tr> 
     
     <tr>   
       <th>회사명</th> 
              <td> 
           <input type="text" name="companyName" >
        
       </td> 

     </tr> 
    
  </TABLE>
  
 
  <DIV align="center" style="margin-top: 50px;">
    <input type='submit' value='회원가입'>
    <input type='reset' value='취소'>
  </DIV>

 </FORM>
 

 

</body>

</html> 