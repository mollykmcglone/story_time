class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.column :title, :string

      t.timestamps
    end

    create_table :images do |t|
      t.column :image, :string

      t.timestamps
    end

    create_table :contributions do |t|
      t.column :sentence, :string
      t.column :username, :string
      t.column :story_id, :integer
      t.column :image_id, :integer

      t.timestamps
    end
  end
end
