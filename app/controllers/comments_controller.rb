class CommentsController < ApplicationController

	before_action :authenticate_user!
	def new
		@comment= Comment.new
	end
	def create
		@movie = Movie.find(params[:movie_id]) 
		@comment= @movie.comments.new(comment_params)
		@comment.user_id = current_user.id
		
		if @comment.save
    		 Thread.new{
       @email = ReviewMail.new
       @m = Movie.find(params[:movie_id])
       @email.thankyou_mail(current_user,@m,@comment)



     }

     redirect_to movie_path(params[:movie_id]),notice: "Review add successfully"
   else
     redirect_to movie_path(params[:movie_id]),alert: "Review cannot Saved"
   end

		
		
	end

	private
	def comment_params
		params.require(:comment).permit( :review)
	end
end
