package com.aditya.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aditya.model.Student;
import com.aditya.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	String Navogation = "student";
	
	
	@RequestMapping(value="/student.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Student student, BindingResult result, @RequestParam String action, Map<String, Object> map){
		Student studentResult = new Student();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
		case "add":
			System.out.println(action);
			studentService.add(student);
			studentResult = student;
			break;
		case "edit":
			System.out.println(action);
			studentService.edit(student);
			studentResult = student;
			break;
		case "delete":
			System.out.println(action);
			studentService.delete(student.getStudentId());
			studentResult = new Student();
			break;
		case "search":
			System.out.println(action);
			Student searchedStudent = studentService.getStudent(student.getStudentId());
			studentResult = searchedStudent!=null ? searchedStudent : new Student();
			break;
			
		case "academic":
			System.out.println(action);
			//System.out.println(action);
			Student searchedStudent1 = studentService.getStudent(student.getStudentId());
			studentResult = searchedStudent1!=null ? searchedStudent1 : new Student();
			Navogation="academic";
			break;
		case "fee":
			System.out.println(action);
			Student searchedStudent2 = studentService.getStudent(student.getStudentId());
			studentResult = searchedStudent2!=null ? searchedStudent2 : new Student();
			Navogation="fee";
			break;
		case "home":
			Student student1 = new Student();
			map.put("student", student1);
			map.put("studentList", studentService.getAllStudent());
			Navogation = "student";
			
	//	Navogation="fee";
			break;
		case "contact":
			System.out.println(action);
			Navogation="sendmail";
			break;
			
		}
		map.put("student", studentResult);
		map.put("studentList", studentService.getAllStudent());
		return Navogation;
	}
}
