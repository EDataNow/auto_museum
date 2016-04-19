class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :position
      t.string :video
      t.string :pdf
      t.string :audio
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
