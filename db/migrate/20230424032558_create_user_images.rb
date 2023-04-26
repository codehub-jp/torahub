class CreateUserImages < ActiveRecord::Migration[7.0]
  def change
    create_table :user_images do |t|
      t.integer :user_id
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type

      t.timestamps
    end
  end
end
