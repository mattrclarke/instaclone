class ProfileController < ApplicationController

  def show
    @facade = ProfileShowFacade.new
    @profile = Profile.find(params[:id])
    @posts = Post.all
    @post = Post.new
  end

  private
  def profile_params
      params.require(:profile).permit(:first_name, :last_name)
  end
end
