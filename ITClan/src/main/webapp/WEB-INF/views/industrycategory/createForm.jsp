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
      action='./create'>
      
  <TABLE class='table'>
       <tr>  
       <th>분류코드</th> 
       <td> 
           <input type="text" name="categoryCode"> 
       </td> 
     </tr>  
     <tr>  
       <th>분류명</th> 
       <td> <input type="text" name="categoryName"> </td> 
     </tr> 
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>

 

 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 