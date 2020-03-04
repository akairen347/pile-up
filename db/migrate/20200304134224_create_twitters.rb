class CreateTwitters < ActiveRecord::Migration[5.2]
  def change
    create_table :twitters do |t|
      t.string :provider
      t.string :uid
      t.string :username
      t.string :image_url

      t.timestamps
    end
  end
end
