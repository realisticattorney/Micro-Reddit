Rails recharged

class Author < ApplicationRecord
end

ApplicationRecord #is the superclass of models (database models). 


@book = Book.create(published_at: Time.now, author_id: @author.id)

#poetic. @book is an instance variable. create, .now built-in methods inherited from somewhere. 

@books = Book.where(author_id: @author.id)
@books.each do |book|
  book.destroy  #is .each mapping through id's of all @books?
end
@author.destroy

#same here, @books =/= @book. @books become all the instances .where author_id: @Foucault.id    .destroy is also built-in


But there is no connection between these 2 classes and its instances. 
On the contrary, here:

class Author < ApplicationRecord
   has_many :books, dependent: :destroy #is dependent a parameter saying what action (e.g. destroy) affects all the dependents (e.g books)?
 end
 
 class Book < ApplicationRecord
   belongs_to :author
 end

 
 With this code, creating a new instance is easier

 @book = @author.books.create(published_at: Time.now) # I knew it. author_id is lacking of course, that you've been redundant of belongs_to assoc.

 now to delete you just:

 @author.destroy


 #by declaring that one model belongs_to another, you instruct Rails to maintain Primary Key-Foreign Key information between instances of the two models
 foreign key  	A key that has migrated to another entity.  e.g. author_id
 Primary Key The key (or attribute) selected to migrate to other entities



 belongs_to each instance of the declaring model belongs to one instance of the other model All instances to One instance
 (many ids to one author_id) belongs_to associations must use the singular term (belongs_to :author)
If @book instances belongs_to author but author doesnt has_many (so it is not a bi-directional assoc.), each book doesnt know about its siblings



 class CreateBooks < ActiveRecord::Migration[6.0]  
   def change
     create_table :authors do |t|
       t.string :name
       t.timestamps
     end
 
     create_table :books do |t|
       t.belongs_to :author
       t.datetime :published_at
       t.timestamps
     end
   end
 end

 another example

 class CreateSuppliers < ActiveRecord::Migration[6.0]
   def change
     create_table :suppliers do |t|
       t.string :name
       t.timestamps
     end
 
     create_table :accounts do |t|
       t.belongs_to :supplier, index: { unique: true }, foreign_key: true #this is ensuring that index is unique and that... it's the selected foreign key?
       t.string :account_number
       t.timestamps
     end
   end
 end
 




 > u = User.new(name:  "ada")
 u.valid? true
 


