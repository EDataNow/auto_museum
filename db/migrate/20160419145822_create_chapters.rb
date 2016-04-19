class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :video
      t.string :pdf
      t.string :audio
      t.integer :postition
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
