package com.aditya.service;

import java.util.List;

import com.aditya.model.Student;

public interface StudentService {
	public void add(Student student);
	public void edit(Student student);
	public void delete(int studentId);
	public com.aditya.model.Student getStudent(int studentId);
	public List getAllStudent();
}
