#Task 1: Design the Database Schema
Create table students (student_id serial PRIMARY KEY,name Varchar(50),age int,gender varchar(10));
Create table courses(course_id serial primary key,course_name varchar(50),credit int,capacity int);
Create table enrollments(enrollment_id serial primary key,student_id INT,course_id INT,foreign key (student_id) references students(student_id),foreign key (course_id) references courses(course_id));
#Task 2: Populate Tables with Sample Data
insert into students (name,age,gender) values ('Michel',26,'M'),('Alia',25,'F'),('Ali',30,'M'),('Idil',23,'F'),('Abdi',20,'M');
insert into courses (course_name,credit,capacity) values('Python',2,15),('Anglais',10,25),('Francais',30,36),('Mathematique',35,50)
insert into enrollments (student_id, course_id) values (1, 1),(2, 1),(3, 2),(4, 2),(5, 2),(1, 3),(2, 4),(3, 4);

#Task 3: Query Student Enrollment Details

Select st.name,co.course_name,co.credit from students st,courses co,enrollments en where st.student_id=co.course_id
select st.name from students st left join enrollments en on st.student_id=en.student_id where en.enrollment_id is null

#Task 4: Query Course Statistics
select co .course_name, count(en.student_id)from courses co left join enrollments en on co.course_id=en.course_id group by co.course_name
select co.course_name,count(en.student_id),co.capacity from courses co left join enrollments en on co.course_id=en.course_id group by co.course_name,co.capacity having count (en.student_id)>co.capacity/2

#Task 5: Advanced Enrollment Analysis
select st.student_id,st.name,sum(co.credit) from students st join enrollments en on st.student_id=en.student_id join courses co on en.course_id=co.course_id group by st.student_id;
select co.course_id,co.course_name from courses co left join enrollments en on co.course_id=en.course_id where en.enrollment_id is null;
Task 6: Implement Constraints
Task 7: Clean and Reset Data
delete from enrollments where course_id=1
delete from students where student_id not in(select distinct student_id from enrollments)
