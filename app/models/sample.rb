class Sample < ActiveRecord::Base
	serialize :batches, Array
	serialize :tris, Array

	belongs_to :collection
end
