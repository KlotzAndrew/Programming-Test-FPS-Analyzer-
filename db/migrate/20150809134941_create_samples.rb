class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
			t.integer :collection_id
			t.time :datetime
			t.float :fps
			t.string :batches #string array OR table w/ 5 columns
			t.string :tris #string array OR table w/ 5 columns
			t.integer :num_particle_systems
			t.integer :num_particles
			t.float :domino_step_ms
			t.integer :num_static_rigid_bodies
			t.integer :num_kinematic_rigid_bodies
			t.integer :num_dynamic_rigid_bodies
			t.integer :num_awake_bodies
			t.string :MainThreadbound
			t.string :GPUbound
      t.timestamps
    end
  end
end
