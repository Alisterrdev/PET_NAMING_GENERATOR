class RenameUsersIdToUserIdInAnimals < ActiveRecord::Migration[7.1]
  def change
    rename_column :animals, :users_id, :user_id
  end
end
