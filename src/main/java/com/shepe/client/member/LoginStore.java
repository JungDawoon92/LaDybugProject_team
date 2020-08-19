package com.shepe.client.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class LoginStore {
//  private static LoginStore loginStore = new LoginStore();
//  private static volatile LoginStore loginStore = new LoginStore();
  private static volatile LoginStore loginStore;
  
  private Map<String, HttpSession> loginSessions;
  
  private LoginStore() { //private 로 하면 생성자를 호출할 수 없다.
      loginSessions = new HashMap<String, HttpSession>();
  }
  
  // synchronized 동기화
  public static synchronized LoginStore getInstance() { // LoginStore 내부에서 생성자를 만든다.
      // static : (메모리를 따로 가져간다.) instance를 만들지 않아도 사용할 수 있다. 
//      LoginStore loginStore = new LoginStore();
      
      if (loginStore == null) {
          loginStore = new LoginStore();
      }
      return loginStore;
  }
  
  public void add( String memberId, HttpSession session ) {
      loginSessions.put(memberId, session);
  }
  
  public HttpSession get( String memberId ) {
      return loginSessions.get(memberId);
  }
  
  public void logout( String memberId ) {
      if ( loginSessions.containsKey(memberId) ) {
          loginSessions.get(memberId).invalidate(); // logout 시키기
          loginSessions.remove(memberId);
      }
  }
  
}
