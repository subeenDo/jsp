package com.common;

public class Person {

    private String name;

    private int age; //만들어놓고

    public Person() {} // Alt+Insert 생성자 선택안함

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    } // Alt+Insert 생성자 둘 다 선택

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    } //Alt+Insert getter, setter 모두 불러오기
}
