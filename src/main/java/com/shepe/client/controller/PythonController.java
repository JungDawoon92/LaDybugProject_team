package com.shepe.client.controller;

import javax.servlet.http.HttpServletRequest;

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
	

	@RequestMapping(value = "/pythonTest", method=RequestMethod.GET)
	public void getTest(HttpServletRequest requset) {
		
		String mk = requset.getSession().getServletContext().getRealPath("/resources/python/test.py");
		intPre = new PythonInterpreter();
		intPre.execfile(mk);
 		PyFunction pyFuntion = (PyFunction) intPre.get("testFunc", PyFunction.class);
		int a = 10, b = 20;
		PyObject pyobj = pyFuntion.__call__(new PyInteger(a), new PyInteger(b));
		System.out.println(pyobj.toString());

		
	}
}
