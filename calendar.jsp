<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.Zoneld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="ja_JP" />
<%!
private static Map map1 = new HashMap();
static {
map1.put("a","春一番");
map1.put("b","修二会");
map1.put("c","お水取り");
map1.put("d","バレンタインデー");
map1.put("E","三社際");
map1.put("F","祇園祭");
map1.put("G","海の日");
map1.put("H","七夕");
map1.put("I","立秋");
map1.put("J","七五三");
map1.put("K","事始め");
map1.put("L","門松");
map1.put("M","大晦日");
map1.put("N","除夜の鐘");
map1.put("O","正月");
map1.put("P","初夢");
map1.put("Q","鏡開き");
map1.put("R","成育");
map1.put("S","成人");
map1.put("T","婚姻");
}
%>
<%
String year=(String)request.getParameter("year");
String month=(String)request.getParameter("month");
String day=(String)request.getParameter("day");
LocalDate localDate=null;
if(year==null||month==null||day==null) {
localDate=LocalDate.now();
year=String.valueOf(localDate.getYear());
month=String.valueOf(localDate.getMonthValue());
day=String.valueOf(localDate.getDayOfMonth());
} else {
localDate=LocalDate.of(lnteger.parselnt(year),lnteger.parselnt(month),lnteger.parselnt(day));
}
String[] dates={String.valueOf(year),String.valueOf(month),String.valueOf(day)};
pageContext.setAttribute("dates",dates);
pageContext.setAttribute("date",Date.from(localDate.atStartOfDay(Zoneld.systemDefault()).tolnstant()));
String event=(String)eventMap.get(year+month+day);
pageContext.setAttribute("event",event);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<style>
ul {
list-style: none;
}
</style>
</head>
<body>
  <form method="POST" action="/jsp/calendar.jsp">
    <ul>
      <li><input type="text” name="year" value="${param['year']}" /><label for="year">年</><input type="text" name="month" value="${param['month']}" /><label for="month">月</><input type="text" name="day" value="${param['day']}" defalut="" /><label for="month">日</></li>
      <li><input type="submit" value="送信" />
      <li><c:out value="${fn:join(dates, '/')}" /> (<fmt:formatDate value="${date}" pattern="E" />)</li>
      <li><c:out value="${event}" /></li>
    </ul>
  </form>
</body>
</html>