class AuthorStatusesController < ApplicationController
	before_filter :signed_in_author, only: [:create, :destroy]
	before_filter :correct_author, only: :destroy
	
	def index
	end
	
	def create
		@author_status = current_author.author_statuses.build(params[:author_status])
		if @author_status.save
			flash[:success] = "Status saved!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end
	
	def destroy
		@author_status.destroy
		redirect_to root_url
	end
	
	private
		def correct_author
			@author_status = current_author.author_statuses.find_by_id(params[:id])
			rescue
				redirect_to root_url if @author_status.nil?
		end

end
