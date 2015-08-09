class Collection < ActiveRecord::Base
	serialize :location, Hash

	has_many :samples


	def self.collection_fps(id)
		samples = Collection.find(id).samples.map {|x| x.fps}
		mean = samples.sum/samples.count

		return {
			observations: samples.count,
			sum: samples.sum,
			mean: mean.round(2),
			min: samples.min,
			max: samples.max,
			std: ((samples.map {|x| (x - mean).abs}.sum)/(samples.count)).round(2)
		}
	end
end
