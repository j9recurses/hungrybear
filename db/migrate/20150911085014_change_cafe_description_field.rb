class ChangeCafeDescriptionField < ActiveRecord::Migration
  def change
    change_column :cafes, :description, :text
  end
end
