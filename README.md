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
  email: string [unique, present, format: {without: @, message.capitalize: 'please enter a valid address']

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
  years: integer[present,inclusion: { in: 1..100)}]
  
  
genders
 has_many :profile_tabs
 gender: string [present, inclusion: { in: %w(male female)}]


 
3. You want to build a virtual pinboard, so you’ll have users on your platform who can create “pins”. Each pin will contain the URL to an image on the web. Users can comment on pins (but can’t comment on comments).


users

 username: string [unique, present, length: { in: 6..20 }]
 email: string [unique, present, format: {regex}]
 has_many :pins
 has_many :comments, through: pins

pins
  belongs_to :user
  has_many :comments
  img: url [present]
  user_id: integer[present]

comments
  belongs_to :user
  belongs_to :pin
  comment: string [present]
  pin_id: integer[present]
  user_id: integer[present]



4-You want to build a message board like Hacker News. Users can post links. Other users can comment on these submissions or comment on the comments. How would you make sure a comment knows where in the hierarchy it lives?



users

  username: string [unique, present, length: { in: 6..20 }]
  email: string [unique, presence, format: {regex}]
  has_many :entries
  has_many :comments

entries
  entry: url [present]
  belongs_to :user
  has_many :comments
  user_id: integer[present]

comments
  belongs_to :user
  belongs_to :entry
  has_many :comments, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment", optional: true
  
