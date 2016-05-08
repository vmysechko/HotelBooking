package com.mysechko.hotelbooking.commands;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public class CommandExecutor {
	
	private static Map<String, Command> commandsStorage = new HashMap<>();
	
	static{
		commandsStorage.put("/login", new ShowLoginPageCommand());
		
	}
	
	public static Command getCommand(HttpServletRequest request){
		String path = request.getRequestURI().replace(request.getContextPath(), "");	// temporary workaround
		return commandsStorage.get(path);
	}

}
