# frozen_string_literal: true

class RemoveStringFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :string, :string
  end
end
