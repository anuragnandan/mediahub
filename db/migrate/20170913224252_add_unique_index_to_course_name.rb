class AddUniqueIndexToCourseName < ActiveRecord::Migration
  def change
    add_index :courses, :name, unique: true
  end
end
