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

String addr = null;
addr = request.getParameter("addr"); 

String addrName = null;
addrName = request.getParameter("addrName"); 

String dutyTel3 = null;
dutyTel3 = request.getParameter("dutyTel3"); 

List<Map> addrList = new ArrayList();
List<Map> LocAddr = new ArrayList();

String dataurl = "http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEgytBassInfoInqire";
String serviceKey = "가용병상정보 API KEY";
String appKey = "카카오맵 API KEY";
int pageA = 1;
int numOfRows = 10;

String url = dataurl + "?serviceKey=" + serviceKey
+ "&HPID=" + addr + "&pageNo=" + pageA + "&numOfRows=" + numOfRows;

DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

DocumentBuilder builder = factory.newDocumentBuilder();

Document document = builder.parse(url);

NodeList items = document.getElementsByTagName("item");

String[] elements = {"wgs84Lat", "wgs84Lon"};

String[] locationAddr = {"dutyAddr"};

for(int i=0; i < items.getLength(); i++) {
	
	Node n = items.item(i);
	
	Element e = (Element) n;
	
	Map<String, String> addrMap = new HashMap();
	
	//child를 기준으로 for문 만들기
	for(String element : elements) {
		NodeList titleList = e.getElementsByTagName(element);
		Element titleElement = (Element)titleList.item(0);
		Node titleNode = titleElement.getChildNodes().item(0);
		addrMap.put(element, titleNode.getNodeValue());
		
	}
	//리스트에 map 담기
	addrList.add(addrMap);
}

for(int i=0; i < items.getLength(); i++) {
	
	Node n = items.item(i);
	
	Element e = (Element) n;
	
	Map<String, String> locAddr = new HashMap();
	
	//child를 기준으로 for문 만들기
	for(String element : locationAddr) {
		NodeList titleList = e.getElementsByTagName(element);
		Element titleElement = (Element)titleList.item(0);
		Node titleNode = titleElement.getChildNodes().item(0);
		locAddr.put(element, titleNode.getNodeValue());
		
	}
	//리스트에 map 담기
	LocAddr.add(locAddr);
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/custom.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:1084px;height:600px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=appKey%>"></script>
	<script>
		<%for(Map addrMap : addrList){ %>
		wgs84Lat = <%= addrMap.get("wgs84Lat") %>
		wgs84Lon = <%= addrMap.get("wgs84Lon") %>
		<%} %>
		
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(wgs84Lat, wgs84Lon),
			level: 2
		};
		var map = new kakao.maps.Map(container, options);
		
		var mapTypeControl = new kakao.maps.MapTypeControl();

		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		var points = [
		    new kakao.maps.LatLng(wgs84Lat, wgs84Lon)
		];

		var bounds = new kakao.maps.LatLngBounds();    

		var i, marker;
		for (i = 0; i < points.length; i++) {
		    marker =     new kakao.maps.Marker({ position : points[i] });
		    marker.setMap(map);
		    bounds.extend(points[i]);
		}
		
		function setBounds() {
		    map.setBounds(bounds);
		}
		var iwContent = '<div style="padding:5px;"><%=addrName%><br><%=dutyTel3 %></div>',
	    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
	  
		infowindow.open(map, marker); 
	</script>
	<p align="right">
	<%for(Map locAddr : LocAddr){ %>
		<%= locAddr.get("dutyAddr") %>
	<%} %>&emsp;
	<button onclick="setBounds()">지도 범위 재설정</button>&emsp;
	<a href="javascript:history.back();"><input type="button" value="목록 보기"></a>
	</p>
</body>
</html>