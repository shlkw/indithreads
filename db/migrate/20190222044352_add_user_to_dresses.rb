class AddUserToDresses < ActiveRecord::Migration[5.2]
  def change
    add_column :dresses, :user_id, :integer
  end
end
