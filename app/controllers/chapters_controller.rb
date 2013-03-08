class ChaptersController < ApplicationController
    before_filter :signed_in_author, only: [:edit, :update, :destroy]
    before_filter :correct_author, only: [:create, :edit, :update, :destroy]

  def new
  	@project = Project.find_by_id(params[:project_id])
  	@chapter = @project.chapters.new
  end

  def show
  	@project = Project.find_by_id(params[:project_id])
  	@chapter = Chapter.find(params[:id])
  end

  def index
  	@project = Project.find(params[:project_id])
  	@chapters = Chapter.paginate(page: params[:page])
  end

# get project id in hidden field in creation form
  def create
	@project = Project.find(params[:project_id])
	@chapter = @project.chapters.build(params[:chapter])
	if @chapter.save
	  	flash[:success] = "Chapter created"
		redirect_to project_chapter_path(@project, @chapter)
	  else
		render 'new'
	end
  end
  
  def edit
  	@project = Project.find(params[:project_id])
  	@chapter = Chapter.find(params[:id])
  end

  def update
  	@project = Project.find(params[:project_id])
  	@chapter = Chapter.find(params[:id])
  	if @chapter.update_attributes(params[:chapter])
		flash[:success] = "Chapter updated"
		redirect_to project_chapter_path(@project, @chapter)
	else
		render 'edit'
	end
  end

  def destroy
  	@project = Project.find(params[:project_id])
  	@chapter = Chapter.find(params[:id])
  	@chapter.destroy
    flash[:success] = "Chapter destroyed"
    redirect_to @project
  end
  
  private
	def correct_author
	  @project = Project.find_by_id(params[:project_id])
	  @trueAuthor = @project.author
	  redirect_to current_author if @trueAuthor != current_author
	end
end
