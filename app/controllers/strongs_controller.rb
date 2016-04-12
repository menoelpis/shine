class StrongsController < ApplicationController

	def index
		@strongs = Strong.all.limit(10)
	end
end