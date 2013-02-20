class AuthorsController < ApplicationController
    before_filter :signed_in_author, only: [:index, :edit, :update, :destroy, :following, :followers]
    before_filter :correct_author, only: [:edit, :update]
    before_filter :admin_author, only: :destroy
    
    def show
        @author = Author.find(params[:id])
        @author_statuses = @author.author_statuses.paginate(page: params[:page])
    end
    
    def new
        @author = Author.new
    end
    
    def create
        @author = Author.new(params[:author])
        if @author.save
            sign_in @author
            flash[:success] = "Welcome to the club!"
            redirect_to @author
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @author.update_attributes(params[:author])
            flash[:success] = "Profile updated"
            sign_in @author
            redirect_to @author
        else
            render 'edit'
        end
    end
    
    def index
        @authors = Author.paginate(page: params[:page])
    end
    
    def destroy
    	Author.find(params[:id]).destroy
    	flash[:success] = "Author destroyed"
    	redirect_to authors_url
    end
    
    def following
    	@title = "Following"
    	@author = Author.find(params[:id])
    	@authors = @author.followed_authors.paginate(page: params[:page])
    	render 'show_follow'
    end
    
    def followers
    	@title = "Followers"
    	@author = Author.find(params[:id])
    	@authors = @author.followers.paginate(page: params[:page])
    	render 'show_follow'
    end
    
    def projects
    	@author = Author.find(params[:id])
    	@projects = @author.projects.paginate(page: params[:page], per_page: 5)
    	render 'show_projects'
    end
    	   
    private
        
        def correct_author
            @author = Author.find(params[:id])
            redirect_to(root_path) unless current_author?(@author)
        end
        
        def admin_author
        	redirect_to(root_path) unless current_author.admin?
        end
end
