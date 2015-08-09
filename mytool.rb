require_relative './config/environment'


a, i = Dir.entries("./FPSLogs").count, 0
ARGV.each do |file|
	ActiveRecord::Base.transaction do
	Dir.foreach("./#{file}") do |item|
		i += 1
	  	begin
			data = File.read("./#{file}/#{item}")
			json_data = JSON.parse(data)

			collect = json_data["collections"][0]
				collection = Collection.create(
					:datetime => collect["datetime"],
					:seed => collect["seed"],
					:act => collect["act"],
					:world => collect["world"],
					:scene => collect["scene"],
					:quest_step => collect["quest_step"],
					:location => collect["location"],
					:class_name => collect["class"])

				json_data["collections"][0]["samples"].each do |x|
					sample = Sample.create(
						:collection_id => collection.id,
						:datetime => x["datetime"],
						:fps => x["fps"],
						:batches => x["batches"],
						:tris => x["tris"],
						:num_particle_systems => x["num_particle_systems"],
						:num_particles => x["num_particles"],
						:domino_step_ms => x["domino_step_ms"],
						:num_static_rigid_bodies => x["num_static_rigid_bodies"],
						:num_kinematic_rigid_bodies => x["num_kinematic_rigid_bodies"],
						:num_dynamic_rigid_bodies => x["num_dynamic_rigid_bodies"],
						:num_awake_bodies => x["num_awake_bodies"],
						:MainThreadbound => x["Main Thread bound"],
						:GPUbound => x["GPU bound"])
				end
	  	rescue
	  		puts "ERROR, unable to parse: #{item}"
	  	end
		puts "finished (#{i}/#{a}): #{item}"
	end
	end
end

