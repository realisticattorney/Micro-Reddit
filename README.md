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


2- You are building the profile tab for a new user on your site. You are already storing your user’s username and email, but now you want to collect demographic information like city, state, country, age and gender. Think – how many profiles should a user have? How would you relate this to the User model?



users 
  username: string [unique, present, length: { in: 6..20 }]
  email: string [unique, presence, format: {without: @, message.capitalize: 'please enter a valid address']

profile_tabs
  has_one :user
  belongs_to :city
  belongs_to :age
  belongs_to :gender


cites
  has_many :profile_tabs
  belongs_to :state
  name: string [unique, present]
  state_id: integer [present]

states
  has_many :profile_tabs
  has_many :cities
  belongs_to :country
  country_id: integer [unique, present]
  name: string [unique, present]

countries
 has_many: :profile_tabs
 has_many :cities, through: :states

ages
  has_many :profile_tabs
  years: integer[presence,inclusion: { in: 1..100)}]
  
  
genders
 has_many :profile_tabs
 gender: string [presence, inclusion: { in: %w(male female)}]