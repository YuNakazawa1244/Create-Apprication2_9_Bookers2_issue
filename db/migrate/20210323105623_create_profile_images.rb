class CreateProfileImages < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_images do |t|
      t.string :name
      t.string :image_id
      t.integer :profile_image_id

      t.timestamps
    end
  end
end
