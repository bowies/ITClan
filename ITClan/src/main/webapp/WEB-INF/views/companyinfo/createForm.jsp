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
       </td> 
     </tr>  
     <tr>  
       <th>회사명</th> 
       <td> <input type="text" name="companyName"> </td> 
     </tr> 
    <tr>  
       <th>기업형태</th> 
       <td> <input type="text" name="companyScale" > </td> 
     </tr> 
     <tr>  
       <th>대표자명</th> 
       <td> <input type="text" name="bossName" > </td> 
     </tr> 
    
     <tr>  
       <th>사업자번호</th> 
       <td><input type="text" name="companyNumber" ></td> 
     </tr> 
         
     <tr>  
       <th>회사마크사진파일명</th> 
       <td> 
           <input type="text" name="ci" > 
       </td> 
     </tr> 
     <tr>   
       <th>분류코드</th> 
              <td> 
           <input type="text" name="categoryCode" >
        
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