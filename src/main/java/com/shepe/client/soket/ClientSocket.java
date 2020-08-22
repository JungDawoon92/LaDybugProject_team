package com.shepe.client.soket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadsocket/{userID}")
public class ClientSocket {

	private static Map<String, Session> clientMap = Collections.synchronizedMap(new HashMap<String, Session>());

	public <K, V> K getKey(Map<K, V> map, V value) {
		 
        for (K key : map.keySet()) {
            if (value.equals(map.get(key))) {
            	System.out.println(key);
                return key;
            }
        }
        return null;
	}
	
	public static void sendMessage(String key, String message) {

		Session stream = clientMap.get(key);
		
		if(stream == null) {
		} else {
			try {
				stream.getBasicRemote().sendText(message);
			} catch (IOException e) {
				e.printStackTrace(); 
			}
		}
	}
	
	@OnOpen
	public void handleOpen(Session userSession, @PathParam("userID") String userID) {
			System.out.println(userID);
			clientMap.put(userID, userSession);
	}

	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		String key = getKey(clientMap, userSession);
		AdminSocket.sendMessage(key, message);	
	}


	@OnClose
	public void handleClose(Session userSession) {
		String key = getKey(clientMap, userSession);

			AdminSocket.bye(key);
// 위 유저 접속 리스트에서 유저를 삭제한다.
			clientMap.remove(key);
	}
	

}
