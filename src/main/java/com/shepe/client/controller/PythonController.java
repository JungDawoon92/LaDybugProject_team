package com.shepe.client.controller;

import org.python.core.PyFunction;
import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PythonController {
	
	private static PythonInterpreter intPre;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String getTest() {
		intPre = new PythonInterpreter();
		intPre.execfile("src/main/clt/test.py");
		intPre.exec("print(testFunc(5,10)");
		
		PyFunction pyFuntion = (PyFunction) intPre.get("testFunc", PyFunction.class);
		int a = 10, b = 20;
		PyObject pyobj = pyFuntion.__call__(new PyInteger(a), new PyInteger(b));
		System.out.println(pyobj.toString());
		
		return pyobj.toString();
		
	}
	
	

}
