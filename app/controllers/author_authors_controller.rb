class AuthorAuthorsController < ApplicationController
	before_filter :signed_in_author
	
	def create
		@author = Author.find(params[:author_author][:followed_id])
		current_author.follow!(@author)
		respond_to do |format|
			format.html { redirect_to @author }
			format.js
		end
	end
	
	def destroy
		@author = AuthorAuthor.find(params[:id]).followed
		current_author.unfollow!(@author)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end
	
end
