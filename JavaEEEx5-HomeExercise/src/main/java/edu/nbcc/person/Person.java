package edu.nbcc.person;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Person {
	private int id;
	private String firstName;
	private String lastName;
	private String emailAddress;
	private double salary;
	private List<Person> mockUpData = new ArrayList<Person>();
	
	/**
	 * default and overloaded constructor that assigns all properties.
	 * @param id
	 * @param firstName
	 * @param lastName
	 * @param emailAddress
	 * @param salary
	 */
	public Person(int id, String firstName, String lastName, String emailAddress, double salary) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailAddress = emailAddress;
		this.salary = salary;
	}
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the emailAddress
	 */
	public String getEmailAddress() {
		return emailAddress;
	}

	/**
	 * @param emailAddress the emailAddress to set
	 */
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	/**
	 * @return the salary
	 */
	public double getSalary() {
		return salary;
	}

	/**
	 * @param salary the salary to set
	 */
	public void setSalary(double salary) {
		this.salary = salary;
	}

	/**
	 * Populate the mockData with Test data of person
	 */
	public Person() {
		mockUpData.add(new Person(mockUpData.size() + 1, "aaa","bbb","ab@g.c", 1000));
		mockUpData.add(new Person(mockUpData.size() + 1, "ccc","ddd","cd@g.c", 3000));
		mockUpData.add(new Person(mockUpData.size() + 1, "eee","fff","ef@g.c", 5000));
	}

	//public method for getPeople Returns the mockData
	public List<Person> getPeople(){
		return mockUpData;
	}

	//Public method for getPerson with id as parameter. 
	public Person getPerson(int id) {
		
		//Use stream and filter for returning the requested course
		List<Person> course= mockUpData.stream().filter(m->m.getId()==id).collect(Collectors.toList());
		
		if (course.size() > 0) {
			return course.get(0);
		}else {
			return null;
		}
	}
}

