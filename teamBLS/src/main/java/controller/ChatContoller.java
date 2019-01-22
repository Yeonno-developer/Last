package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import io.socket.emitter.Emitter;
import io.socket.engineio.client.Socket;

@Controller
public class ChatContoller {
	@RequestMapping("chat/chat")
	public String chat() {
		return null; // return "chat/chat"; //view 이름 설정 // null인 경우에는 @RequestMapping의 url로 설정됨.
		// Map<String, String> teamCode=(Map<String,
		// String>)session.getAttribute("teamCode");
	}

	@RequestMapping("chat/multi")
	public ModelAndView test1(HttpSession session) throws Exception {
		// D:\Spring\Git\reslast\Last\teamBLS\test1
		// D:/Spring/Git/reslast/Last/teamBLS/test1
		ModelAndView mav = new ModelAndView("chat/multichat");
		return mav;
	}

	@RequestMapping("chat/test2")
	public ModelAndView test2() {
		ModelAndView mav = new ModelAndView("chat/t2");
		Socket socket;
		try {
			socket = new Socket("ws://localhost");
			socket.on(Socket.EVENT_OPEN, new Emitter.Listener() {
				@Override
				public void call(Object... args) {
					socket.send("hi");
					socket.close();
				}
			});
			socket.open();
		} catch (Exception e) {

		}
		return mav;
	}
}
