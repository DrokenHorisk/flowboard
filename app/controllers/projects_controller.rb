class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
		@project = Project.new
	end

	def show
	end

	def new
	end

	def create
		@project = Project.new(project_params)
		@project.user = current_user

		if @project.save
			redirect_to projects_path, notice: 'Project was successfully created.'
		else
			@projects = Project.all
			render :index, status: :unprocessable_entity
		end
	end

	def edit
	end

	def update
		if @project.update(project_params)
			redirect_to projects_path, notice: 'Project was successfully updated.'
		else
			render :index, status: :unprocessable_entity
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private

	def set_project
		@project = Project.find_by_id(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :description, :user_id)
	end
end