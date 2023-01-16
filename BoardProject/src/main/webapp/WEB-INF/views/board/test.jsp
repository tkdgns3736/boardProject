<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Insert title here</title>

<style>

	html { height:100%; }
	body { height:100%; margin:0; padding:0; }
	img{height: 40px;}
	
 
  table {
    width: 100%;
    height: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
    text-align:center; 
    background:black
  }
  th, td {
    border: 1px solid #444444;
    padding: 10px;
  }
  
  .thead td{
  	color:white; 
  	background: #2008d9; 
  	height: 80px;
  	font-size: 100px;
	text-align:right;
	border-left: none;
    	border-right: none;
  }
  .thead th{
/*   	color:#b0b402; */
  	color:yellow;
  	height: 50px;
  	font-size: 60px;
  	}
  	
  .tbody td{
  	font-size: -webkit-xxx-large;
  	color:white; 
  	height: 100px;	
  }
  	
  	
   .tbody input{
   	background: black;
    color: red;
    border: 0px;
    height: 100%;
    font-size: 80px;
    width: 100%;
    text-align: center;
   } 
   
   .blue input{color:blue;}	 	 	
  
  .thead input{
  background:  #2008d9;
    color: white;
    border: 0px;
 float: right;
 font-size: 50px;
    width: 50%;
	height: 50%;
     text-align: center;
   }	 		
   .thead input:hover{
    background: #3822e5;
   }
   
   .tbody input:hover{
    background: #262424;
   }
</style>

</head>
<body>
	<br>
    <table>
	
	<colgroup>
		<col width="20%">
		<col width="40%">
		<col width="40%">
	</colgroup>

      <thead Class="thead">
      	<tr>
      		<td colspan="2">EXCHANGE</td> <td Style="vertical-align: bottom;"><input type="text"></td>
      	</tr>
        <tr>
          <th scope="col">CURRENCY</th><th scope="col">CASH</th><th scope="col">T/C</th>
        </tr>
      </thead>
      <tbody Class="tbody">
        <tr>
          <td><img src="images/us.png" />&nbsp;USD</td><td><input type="text"><td><input Style="color:blue;"type="text"></td>
        </tr>
        <tr>
          <td><img src="images/jp.png" />&nbsp; JPY</td><td><input type="text"><td><input Style="color:blue;"type="text"></td>
        </tr>
        <tr>
          <td><img src="images/cn.png" />&nbsp;CNY</td><td><input type="text"><td><input Style="color:blue;"type="text"></td>
        </tr>
        <tr>
          <td><img src="images/eu.png" />&nbsp;EUR</td><td><input type="text"><td><input Style="color:blue;"type="text"></td>
        </tr>	
      </tbody>
    </table>
    <br>
  </body>
</html>