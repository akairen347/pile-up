class AddTimeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :time, :integer
  end
end
