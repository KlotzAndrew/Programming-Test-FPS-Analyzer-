class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
    	t.time :datetime
		t.integer :seed
		t.string :act
		t.string :world
		t.string :scene
		t.string :quest
		t.integer :quest_step
		t.string :location #string hash OR table w/ X, Y, Z
		t.string :class_name

      t.timestamps
    end
  end
end
