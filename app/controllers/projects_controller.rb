class ProjectsController < ApplicationController
    before_filter :signed_in_author, only: [:edit, :update, :destroy]
    before_filter :correct_author, only: [:edit, :update, :destroy]

    def show
        @project = Project.find(params[:id])
        @chapters = @project.chapters
    end
    
    def new
        @project = Project.new
    end

	def create
	  @project = current_author.projects.build(params[:project])
	  if @project.save
	  	flash[:success] = "Project created"
		redirect_to @project
	  else
		render 'new'
	  end
	end
	
	def edit
	end
	
	def update
	  if @project.update_attributes(params[:project])
		flash[:success] = "Project updated"
		redirect_to @project
	  else
		render 'edit'
	  end
	end
	
	def index(id=nil)
		@projects = Project.paginate(page: params[:page])
		@index = true
	end
	
	def destroy
		@project.destroy
    	flash[:success] = "Project destroyed"
    	redirect_to projects_url
	end

  private
	def correct_author
	  	@project = current_author.projects.find_by_id(params[:id])
		@trueProject = Project.find_by_id(params[:id])
		redirect_to @trueProject if @project.nil?
	end

end
