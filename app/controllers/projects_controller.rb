class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    
    if @project.save
      flash[:success] = "New project added"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong..."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update project_params
      flash[:success] = "The project was successfully edited!"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :link, :image)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
