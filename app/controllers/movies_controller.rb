class MoviesController < ApplicationController
before_action :authenticate_admin_user!,only: [:create]
	 impressionist actions: [:show]
	def index
	
	@home_page_movie = Movie.order('rating DESC')
	@new_movies =Movie.order('id DESC')
	@viewed = ViewTable.order('counter DESC').ids

	@top_view=Movie.where(id: @viewed).index_by(&:id).slice(*@viewed).values
	end
	

	def new
		view = params[:view]
	end

	def create
		
		 if params[:view] =='automatic'
		 	
      		@mv = OtherServiceCall.new.api_call(params[:movie][:title])
      		if @mv == true
        		redirect_to "http://192.168.3.3:3000/admin/movies",notice: "movie Successfully Saved"
      		else
       			 redirect_to new_admin_movie_path(view: params[:view]),alert: "Movie Not Found Please verify it."
     		 end
    	else
			@movie = Movie.new(movie_params)
			if @movie.save
				 redirect_to "http://192.168.3.3:3000/admin/movies",notice: "movie Successfully Saved"
      else
        redirect_to new_admin_movie_path

			
			end
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
		search = params[:search]

		if search
		
       
      		@home_page_movie = Movie.where("title like?","#{search}%").order('rating ASC')
  		else
  			@home_page_movie = Movie.order('rating DESC')
      	end
	
	@new_movies =Movie.order('id DESC')
	@viewed = ViewTable.order('counter DESC').collect(&:movie_id)

	@top_view=Movie.where(id: @viewed).index_by(&:id).slice(*@viewed).values
	
	end





	private
	def movie_params
		params.require(:movie).permit(:title, :genre, :plot, :image, :rating, :web, :cast, :year, :view_tables_id)
	end


end
