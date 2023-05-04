package com.green.mart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JumpoController {

	@RequestMapping("/Order")
	public String order() {
		
		return "jumpo/order";
	}
}
