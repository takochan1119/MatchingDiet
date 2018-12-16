class AddColumnToComment2 < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :teacher_id, :integer
  end
end
