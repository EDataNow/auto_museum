class ChangeNameToTitle < ActiveRecord::Migration
  def change
  	rename_column :stories, :name, :title
  	rename_column :chapters, :name, :title
  end
end
