
  package org.academy.controller;
  
  import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
  org.springframework.web.bind.annotation.RequestMapping; import
  org.springframework.web.bind.annotation.RequestMethod;
  
  public class maincontroller {
  
  
  private static final Logger logger =
  LoggerFactory.getLogger(maincontroller.class); //���� ������ �̵�
  
 @RequestMapping(value = "/main", method = RequestMethod.GET) public void
 mainPageGET() {
  
  logger.info("���� ������ ����");
  
  } }
 