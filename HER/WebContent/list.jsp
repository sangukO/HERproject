<%@page import="sun.invoke.empty.Empty"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.PrintWriter" %>
    
<%
String si = null;
String gungu = null;

si = request.getParameter("si");
gungu = request.getParameter("gungu");

//map을 담을 리스트 만들기
List<Map> eList = new ArrayList();
List<Map> aList = new ArrayList();

String dataurl = "http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire";
String serviceKey = "?serviceKey=3IFGsP%2B8isiiCt%2BzQ1FPu837Fcbv3SAMQ%2Fgvtdnb1nM5vS4J8sW91UujJc3l3B53tegX1TZcWv%2BDaeA%2FFwmXUw%3D%3D";
String stage1 = URLEncoder.encode(si,"UTF-8");
String stage2 = URLEncoder.encode(gungu,"UTF-8");

int pageA = 1;	// 페이지 초기값 
int numOfRows = 10; // 페이지 당 보여줄 개수

String url = dataurl + serviceKey
+ "&STAGE1=" + stage1 + "&STAGE2=" + stage2 + "&pageNo=" + pageA + "&numOfRows=" + numOfRows;

DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

DocumentBuilder builder = factory.newDocumentBuilder();

Document document = builder.parse(url);

NodeList items = document.getElementsByTagName("item");

String[] elements = {"dutyName", "dutyTel3", "hvec", "hvoc", "hvgc", "hvcc", "hvncc", "hvccc", "hvicc",
					 "hv2", "hv3", "hv6", "hv7", "hv8", "hv9", "hv10", "hpid" };

for(int i=0; i < items.getLength(); i++) {
	Node n = items.item(i);
	
	Element e = (Element) n;
	
	Map<String, String> er = new HashMap();
	Map<String, String> ar = new HashMap();
	
	//child를 기준으로 for문 만들기
	for(String element : elements) {
		NodeList titleList = e.getElementsByTagName(element);
		Element titleElement = (Element)titleList.item(0);
		Node titleNode = titleElement.getChildNodes().item(0);
		er.put(element, titleNode.getNodeValue());
		
		if (element == "hpid") {
			ar.put(element, titleNode.getNodeValue());
		}
	}
	//리스트에 map 담기
	eList.add(er);
	aList.add(ar);
}

%>

    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/custom.css">
<meta charset="UTF-8">
<title>정보</title>
</head>
<body>
<div class="container">
<br><br>
<h3 align=center><%=si %>&nbsp;<%=gungu %>&nbsp; 주변 응급실 가용 병상 정보</h3>
	<br><br>
	<table class="table table-dark table-striped cellspacing=1 border=1">
	 <thead>
		<tr>
			<th align=center width=130>병원명</th>
			<th align=center width=120>전화번호</th>
			<th align=center width=50>응급실</th>
			<th align=center width=50>수술실</th>
			<th align=center width=60>입원실</th>
			<th align=center width=110>신경중환자실</th>
			<th align=center width=110>신생중환자실</th>
			<th align=center width=110>흉부중환자실</th>
			<th align=center width=110>일반중환자실</th>
			<th align=center width=110>내과중환자실</th>
			<th align=center width=110>외과중환자실</th>
			<th align=center width=110>약물중환자실</th>
			<th align=center width=110>화상중환자실</th>
			<th align=center width=110>외상중환자실</th>
			<th align=center width=110>소아중환자실</th>
		</tr>
	</thead>
	<tbody>
		<%for(Map er : eList){ %>
		<tr>
			<td><form action="map.jsp?addr=<%=er.get("hpid")%>" method="get"><%=er.get("dutyName") %>
			     <%=er.get("dutyName") %> 
                 <input type="hidden" name="addr" value=<%=er.get("hpid") %>>
                 <input type="hidden" name="addrName" value=<%=er.get("dutyName") %>>
                 <input type="hidden" name="dutyTel3" value=<%=er.get("dutyTel3") %>>
			     <input type="submit" value="지도 보기"></form></td>
			<td><%=er.get("dutyTel3") %></td>
			<td><%=er.get("hvec") %></td>
			<td><%=er.get("hvoc") %></td>
			<td><%=er.get("hvgc") %></td>
			<td><%=er.get("hvcc") %></td>
			<td><%=er.get("hvncc") %></td>
			<td><%=er.get("hvccc") %></td>
			<td><%=er.get("hvicc") %></td>
			<td><%=er.get("hv2") %></td>
			<td><%=er.get("hv3") %></td>
			<td><%=er.get("hv7") %></td>
			<td><%=er.get("hv8") %></td>
			<td><%=er.get("hv9") %></td>
			<td><%=er.get("hv10") %></td>
		</tr>
		<%} %>	
		</tbody>
	</table>
	</div>
</body>
</html>