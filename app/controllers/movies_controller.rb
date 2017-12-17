class MoviesController < ApplicationController
	 impressionist actions: [:show]
	def index
	
	@home_page_movie = Movie.order('rating DESC')
	@new_movies =Movie.order('id DESC')
	@viewed = ViewTable.order('counter DESC').ids

	@top_view=Movie.where(id: @viewed).index_by(&:id).slice(*@viewed).values
	end
	

	def new
		
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to movie_path(@movie)

		else
			render 'new'
		end
	end


	def show
		@movie = Movie.find(params[:id])

		impressionist(@movie, "message...")
		u=ViewTable.where(movie_id:@movie.id)
		if u.empty?
			@view = ViewTable.create(:movie_id=> @movie.id, :counter=> @movie.impressionist_count)
		else
			@view= ViewTable.update(u.first.id, :counter=> @movie.impressionist_count)
		end
		
		
		@movie_with_same_genre = Movie.where(:genre => @movie.genre)
	end

	def detail
		@view = params[:view]
		gon.view = @view
		
	@home_page_movie = Movie.order('rating DESC')
	@new_movies =Movie.order('id DESC')
	@viewed = ViewTable.order('counter DESC').ids

	@top_view=Movie.where(id: @viewed).index_by(&:id).slice(*@viewed).values
	
	end

	private
	def movie_params
		params.require(:movie).permit(:title, :genre, :plot, :image, :rating, :web, :cast, :year, :view_tables_id)
	end


end
