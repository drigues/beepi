class DirectoriesController < ApplicationController
  before_action :require_login  # no except needed unless you add public actions

  def create
    directory_name = params[:directory].to_s.strip
    if Directory.exists?(directory: directory_name)
      redirect_to public_profile_path(directory: directory_name), alert: "Directory already claimed."
      return
    end

    @directory = current_user.directories.build(directory: directory_name, name: "", bio: "")
    if @directory.save
      redirect_to edit_directory_path(@directory), notice: "Directory claimed! Please complete your profile."
    else
      redirect_to dashboard_path, alert: "Could not claim directory."
    end
  end

  def edit
    @directory = current_user.directories.find(params[:id])
  end

  def update
    @directory = current_user.directories.find(params[:id])
    if @directory.update(directory_params)
      redirect_to dashboard_path, notice: "Directory updated!"
    else
      render :edit
    end
  end

  private

  def directory_params
    params.require(:directory).permit(:name, :bio)
  end
end