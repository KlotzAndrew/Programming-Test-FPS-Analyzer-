class LogsController < ApplicationController
	before_action :dropdown_values, only: [:index]
	respond_to :html, :xml, :json

	def index
		respond_to do |format|
	      format.html { render }
	      format.json { render json: @collections_json  }
	    end
	end

	def show
		respond_to do |format|
	      format.html { render nothing: true}
	      format.json { render json: @collection = Collection.collection_fps(params[:id]) }
	    end   
	end

	private

	def dropdown_values
		all = Collection.all
		@collections_json ||= all
		@collections ||= all.collect {|p| [ p.world, p.id ] }
		@acts ||= Collection.uniq.pluck(:act).sort
	end

end

