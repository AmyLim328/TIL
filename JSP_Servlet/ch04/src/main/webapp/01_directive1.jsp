<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ������ (Directive)
   : Ŭ���̾�Ʈ ��û�� jsp �������� ����� ��
   �ʿ��� ������ jsp �����̳ʿ��� �˸��� ����
   
   : jsp �������� "�̷��� ó���Ͻÿ� !" ��� ���ø� ������ ��
   
   : �±� �ȿ� @�� ����
   page, include, taglib 
   
   �� taglib: jsp ����� Ȯ���� �� ����ϴ� ����� ���� �±� ����
   jsp �±� (�׼� �±�)�� �������� ���ϴ� �κ��� 
   ����ڰ� ���� �ۼ��Ͽ� �� �±׸� �ҷ��� ����ϰڴٰ� ��
   (xml ���� ���� �ʿ�, ���� ����)
   
   <%@taglib url="url" prefiex="tagPrefix"%>



   1) page   <%@page ....%>
   : jsp �������� �����Ǵ� �Ӽ� ����
   : jsp ���������� jsp �����̳ʿ��� �ش� �������� 
   ��� ó���� ������ ������ ���� �˷��ִ� �� ���
   
   : �ݵ�� �ҹ��ڷ� �ۼ�
   
   info: �ؽ�Ʈ 
   (������ �������ִ� ���ڿ�, �Ӽ��� �����̳� ���� ���Ѿ���)
   (�������� �ʾƵ� ������ ó�� ���뿡 �ƹ��� ������ ������ ����� ���� ���)
   �⺻��: ����
   ex) info="Copyright 2021 by Sally"
   
   
   ----------------------------------
   
   language: ��ũ���� ���
   (jsp �������� ��ũ��Ʈ ��ҿ��� ����� ��� ����)
   �⺻��: "java"
   ex) language="java"
   
   
   ----------------------------------
   
   contentType: MIME Ÿ��, ��������
   (* MIME (Multi-Purpose Internet Mail Extensions
     : ����
     : ���ͳ� ���ڿ��� �������� (SMTP)�� Ȯ���Ͽ� �����, ����, �̹��� �� 
     ���� ������ �����͸� �ְ� ���� �� �ֵ��� Ȯ��� ��������
     : �������� � �� �����̶� ���ۺκп� MIME ��� �ۼ�
     : Ŭ���̾�Ʈ�� ����� ��Ÿ���� ������ ���� (html, gif, xml ��)�� ���� ������ ����
   ) 
   (jsp ������ ������ � ���·� ����� ������ MIME �������� ���������� �˷���)
   (text/html, text/plain, text/xml, text/gif ...)
   
   �⺻��: contentType="text/html:charset=ISO-8859-1"
   ex) contentType="text/html:charset=EUC-KR" (�ѱ� ����)
   (jsp ������ ������ ����ϴ� charset (��������) ����)
   
   
   ----------------------------------
   
   extends: Ŭ���� �̸�
   (jsp �������� JSP �����̳ʿ� ���� Servlet���� ��ȯ�� ��
   ó�� ����� �� ������ �����Ͽ� Ŭ���̾�Ʈ���� ������
   
   extends �Ӽ��� jsp �������� Servlet �ҽ��� ��ȯ�Ǵ�
   �������� �ڽ��� ��ӹ��� Ŭ������ ������ �� ���
   
   ������ jsp �����̳ʰ� �˾Ƽ� ������ Ŭ���� ��ӽ��� ��ȯ
   (����� �� ���� ����))
   
   �⺻��: ����
   ex) extends ="MyPage"
   
   
   ----------------------------------
   
   import: Ŭ����/��Ű�� �̸�
   (jsp ������ ���� package �̸��� �������� �ʰ�
   �ٸ� Ŭ������ �����ͼ� ����ϴ� ���
   
   page ������ �߿� �����ϰ� �ߺ� ��� ����)
   �⺻��: ����
   ex) import="java.util.*, java.sql.*"
   // ���� �� ��Ű���� ��ǥ�� �����ؼ� ��� ����
   
   
   ----------------------------------
   
   session: boolean ��
   (jsp �������� HttpSession�� ������� ���θ� �����ϴ� �Ӽ�
   
   
   - true: ���� �������� ������ �����ϰ� 
   ���� �������� ���� ��쿡�� ���ο� ���� ����/����
   
   - false: ���ǿ� ������� ����
   (���Ŀ� ����))
   �⺻��: "true"
   ex) session="true"
   
   
   
   ----------------------------------
   
   buffer: buffer�� or "none"
   (*buffer: ���� �ӵ��� ũ�� �ٸ� �� ��ġ���� �������̽��� 
   ���� �ӵ����� �����ϱ� ���� ����ϴ� �Ͻ����� ��� ����
   ��ġ�� ���μ����� ���濡 ���� ��ü���� �ʰ� �� �۵��� �� �ֵ��� ��
   ȿ������ ���۸� ����� ���ؼ��� ������ ũ�⸦ ��Ȳ�� �°� �� ���� �ʿ�
   �����͸� ���۷� ����ְų� ������ ������ �����ϴ� ���� �߿�
   )
   (jsp �������� ��� ũ�⸦ ų�ι���Ʈ ������ �����ϴ� �Ӽ�)
   (buffer���� "none"���� �����ϸ� ��� ���� ��������ʰ�
   jsp �������� ��� ������ ��� �η������� ����)
   
   �⺻��: "8kb"
   ex) buffer="12kb" (jsp�� ���� ���� ������ ����� ��)
       buffer="false"
       
   
   ----------------------------------
       
   autoFlush: boolean ��
   (jsp �������� ������� �������� ��µǱ� ����
   ���ۿ� �� ä���� ��� ����Ǿ��ִ� ������� ��� ó������ ����)
   (true: ���۰� �� á�� ��� �ڵ������� �����, ��û�� ������ ���������� ����)
   (buffer �Ӽ� ���� none�� ��� 
   autoFlush �Ӽ��� "false"�� ������ �� ����
   ���۰� ������ ������ ���� �ڵ������� ����� �� ���Բ� ����) 
   
   �⺻��: "true"
   ex) autoFlush="false"
   
   
   
   ----------------------------------
   
   isThreadSafe: boolean��
   (�ϳ��� jsp �������� ���ÿ� ���� �������� ��û�� ó���� �� �ִ��� ����)
   (false: ��û�� ���ÿ� ó������ �ʰ� ��û ������� ó��)
   (������� ������ ó���ϴµ� ����� ���� �ð��� �ɸ� �� �����Ƿ� 
   ����� ó���ð��� �����Ͽ� �����ؾ���)
   
   �⺻��: "true"
   ex) isThreadSafe="true"
   
   ----------------------------------
      
   trimDirectiveWhiteSpaces: boolean��
   (��Ƽ�곪 ��ũ��Ʈ �ڵ�� ���Ͽ� �߻��Ǵ� �� �ٲ� ���ڸ� �����ϴ� �Ӽ�)
   (jsp 2.1���� ���Ӱ� �߰�)
   (true: ���ʿ��� �ٹٱ� ���鹮�� ���ŵ�)
   �⺻��: "false"
   ex) trimDirectiveWhiteSpaces="false"
   
   ----------------------------------
   
   errorPage: ���� URL
   (jsp �������� ó���ϴ� ���߿� ���������� ���ܰ� �߻��� ���
   �ڽ��� ����ó���� ���� �ʰ� �ٸ� ���������� ó���� �� �ֵ��� ����)
   (�Ӽ� �����δ� ���� ���ܸ� ó���� �������� ���� URL �ۼ�)
   �⺻��: ����
   ex) errorPage="error/fail.jsp"
   
   ----------------------------------
      
   isErrorPage: boolean��
   (���� jsp �������� ���� ó���� ����ϴ� ���������� �ƴ��� ���θ� �����ϴµ� ���)
   (��û�� ������ �������� ���ܸ� �߻��Ͽ� ���� ó���� ���ؼ� ������� ���� ���������
   isErrorPage�� 'true'�� ����)
   �⺻��: "false"
   ex) isErrorPage="false"
   
   ----------------------------------
   
   pageEncoding: �������� ĳ���� ���ڵ���
   (jsp 1.2 �Ծ࿡ ���Ӱ� �߰��� �Ӽ�)
   (jsp ���������� ���Ǵ� ĳ������ ���ڵ� ����)
   (���� �����Ǿ������� contentType �Ӽ��� charset ���)
   �⺻��: "ISO-8859-1"
   ex) pageEncoding="EUC-KR"
-->
</body>
</html>