CREATE TABLE departments (
    dept_no VARCHAR(50) NOT NULL,
    dept_name VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE titles(
	title_id VARCHAR(50) NOT NULL,
	title VARCHAR(50),
	CONSTRAINT "pk_titles" PRIMARY KEY("title_id")
);

CREATE TABLE employees(
	"emp_no" INTEGER PRIMARY KEY,
	"emp_title_id" VARCHAR(50) references titles(title_id),
	"birth_date" DATE,
	"first_name" VARCHAR(50),
	"last_name" VARCHAR(50),
	"SEX" VARCHAR(10),
	"hire_date" DATE
);

CREATE TABLE dept_employee(
	emp_no INTEGER references employees(emp_no),
	dept_no VARCHAR(50) references departments(dept_no)
	
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(50) references departments(dept_no),
	emp_no INTEGER references employees(emp_no)
);

CREATE TABLE salaries(
	emp_no INTEGER references employees(emp_no),
	salary INTEGER
);


-- Checking if column values are distinct for primary key
select count(distinct emp_no), count(emp_no)
from employees;

select count(distinct dept_no ), count(dept_no)
from departments;

select count(distinct title_id ), count(title_id)
from titles;
