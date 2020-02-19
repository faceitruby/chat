class CreateTebleBlackList < ActiveRecord::Migration[6.0]
  def change
    create_table :black_lists do |t|
      t.integer :user_id
      t.integer :black_list_id
    end
  end
end
