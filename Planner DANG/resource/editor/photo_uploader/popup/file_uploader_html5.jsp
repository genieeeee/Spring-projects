<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.UUID"%>
<%@page import="java.text.SimpleDateFormat"%>
 
<%
  //파일정보
  String sFileInfo = "";
  //파일명을 받는다 - 일반 원본파일명
  String filename = request.getHeader("file-name");
  //파일 확장자
  String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);


  //파일 기본경로
  String dftFilePath = request.getSession().getServletContext().getRealPath("/");
  //파일 기본경로 _ 상세경로
  String filePath = dftFilePath + "resource" + File.separator + "editor" + File.separator + "multiupload" + File.separator;
  File file = new File(filePath);
  if (!file.exists()) {
      file.mkdirs();
  }
  ///////////////// 서버에 파일쓰기 ///////////////// 
  InputStream is = request.getInputStream();
  OutputStream os = new FileOutputStream(filePath+filename);
  int numRead;
  byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
  while ((numRead = is.read(b, 0, b.length)) != -1) {
      os.write(b, 0, numRead);
  }
  if (is != null) {
      is.close();
  }
  os.flush();
  os.close(); 

  ///////////////// 서버에 파일쓰기 /////////////////

  // 정보 출력
  sFileInfo += "&bNewLine=true";
  sFileInfo += "&sFileName=" + filename;
  sFileInfo += "&sFileURL=multiupload/" + filename;
  out.println(sFileInfo);
  
%>