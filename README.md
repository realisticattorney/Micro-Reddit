# README

Building records warm up tasks:

1-You are building an online learning platform (much like this!). You’ve got many different courses, each with a title and description, and each course has multiple lessons. Lesson content consists of a title and body text.



presumed = {  id:integer
  created_at:datetime
  updated_at:datetime
}



courses
  title:string [unique, present]
  body:text [present]
  author_name: string [unique, present]
  presumed

has_many lessons

lessons
  title:string [unique, present]
  body:text [present]
  course_id: integer 
  presumed

belongs_to course


2