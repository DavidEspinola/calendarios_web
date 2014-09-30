class CreateAsigTags < ActiveRecord::Migration
  def change
    create_table :asig_tags do |t|
    	t.integer "recurso_id"
    	t.integer "tag_id"
		t.timestamps 
    end
  end
end
