class CreateReadChapter < ActiveRecord::Migration
  def change
    create_table :read_chapters do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :chapter, index: true
    	t.timestamps null: false
    end
  end
end
