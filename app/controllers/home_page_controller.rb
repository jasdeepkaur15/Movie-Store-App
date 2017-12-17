class HomePageController < ApplicationController

	def index
	
	@home_page_movie = Movie.order('rating DESC')
	@new_movies =Movie.order('id DESC')
	end
	

end
