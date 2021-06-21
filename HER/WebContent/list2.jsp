<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<%@ page import = "javax.xml.parsers.* ,org.w3c.dom.*, javax.xml.xpath.*, org.xml.sax.InputSource" %>
<!--xml파일을 읽어오기 위해서 위 xml과 w3c를 import하는 것이 반드시 필요합니다.-->
<html>
<head>
</head>
<body>
<%
	//파싱을 위한 준비과정
	DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
	
	//파일을 읽을 때 서버 내부의 local path(전체경로적기)로 지정합니다.
	//이 문장이 xml을 파싱합니다. 이를 위해 위에서 임포트한 문장을 기억할 것!
	Document doc = docBuilder.parse(new File("C:/Users/onwn/git/HER/HER/her.xml"));
	//xml정규화
	doc.getDocumentElement().normalize();
	
	//XPath 생성, XPath는 XML 노드들을 CSS 다루듯이 쉽게 다루도록 도와주는 API 입니다.
	XPath xpath = XPathFactory.newInstance().newXPath();
	
	Element root = doc.getDocumentElement();	//root태그를 가져져오지만 여기서 쓰이는 곳은 없습니다.
	
	NodeList tag_name = doc.getElementsByTagName("dutyName");	
	NodeList tag_tel = doc.getElementsByTagName("dutyTel3");
	NodeList tag_hvec = doc.getElementsByTagName("hvec");
	NodeList tag_hvoc = doc.getElementsByTagName("hvoc");
	NodeList tag_hvgc = doc.getElementsByTagName("hvgc");
	NodeList tag_hvcc = doc.getElementsByTagName("hvcc");
	NodeList tag_hvncc = doc.getElementsByTagName("hvncc");
	NodeList tag_hvccc = doc.getElementsByTagName("hvccc");
	NodeList tag_hvicc = doc.getElementsByTagName("hvicc");
	NodeList tag_hv2 = doc.getElementsByTagName("hv2");
	NodeList tag_hv3 = doc.getElementsByTagName("hv3");
	NodeList tag_hv7 = doc.getElementsByTagName("hv7");
	NodeList tag_hv8 = doc.getElementsByTagName("hv8");
	NodeList tag_hv9 = doc.getElementsByTagName("hv9");
	NodeList tag_hv10 = doc.getElementsByTagName("hv10");
%>
	<div class = "container">
	<h3 align=center>인천광역시 미추홀구 주변 응급실 가용 병상 정보</h3>
	<br><br>
<% 
    //테이블 형태로 데이터 출력
	out.println("<table cellspacing=1 border=1>");
	out.println("<tr>");
	out.println("<th align=center width=30>순번</th>");
	out.println("<th align=center width=130>병원명</th>");
	out.println("<th align=center width=120>전화번호</th>");
	out.println("<th align=center width=50>응급실</th>");
	out.println("<th align=center width=50>수술실</th>");
	out.println("<th align=center width=50>입원실</th>");
	out.println("<th align=center width=110>신경중환자실</th>");
	out.println("<th align=center width=110>신생중환자실</th>");
	out.println("<th align=center width=110>흉부중환자실</th>");
	out.println("<th align=center width=110>일반중환자실</th>");
	out.println("<th align=center width=110>내과중환자실</th>");
	out.println("<th align=center width=110>외과중환자실</th>");
	out.println("<th align=center width=110>약물중환자실</th>");
	out.println("<th align=center width=110>화상중환자실</th>");
	out.println("<th align=center width=110>외상중환자실</th>");
	out.println("<th align=center width=110>소아중환자실</th>");
	out.println("</tr>");
	
	for(int i = 0; i < tag_name.getLength(); i++){
		out.println("<tr>");
		int num = i+1;
		out.println("<td align=center>"+num+"</td>");
		//실제 노드만 취급합니다.
		if(tag_name.item(i).getNodeType()!=Node.ELEMENT_NODE){
			continue;			
		}
		//데이터는 getTextContent() 메소드를 사용하든, getNodeValue() 메소드를 사용하든 출력 결과는 같습니다.
		//xml의 소재지지번주소 컬럼의 값이 null인 경우 읽어오다가 오류가 발생합니다.
		//이때 if문으로 제어가 되지 않아 try catch 를 통해 잡았습니다.
		//아래 내용은 소재지지번주소가 없을 경우 소재지도로명주소 컬럼값을 읽어오도록 한 것 입니다.
//		try{
//			out.println("<td align=center>"+tag_name.item(i).getFirstChild().getTextContent()+"</td>");
//		}catch(Exception e){
//			out.println("<td align=center>"+tag_tel.item(i).getFirstChild().getTextContent()+"</td>");
//		}
		out.println("<td align=center>"+tag_name.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_tel.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hvec.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hvoc.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hvgc.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hvcc.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hvncc.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hvccc.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hvicc.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hv2.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hv3.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hv7.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hv8.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hv9.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("<td align=center>"+tag_hv10.item(i).getFirstChild().getTextContent()+"</td>");
		out.println("</tr>");
	}
	
	out.println("</table>");
%>
</div>
</body>
</html>