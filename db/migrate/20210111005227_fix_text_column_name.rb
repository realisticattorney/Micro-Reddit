class FixTextColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :text, :title
  end
end
