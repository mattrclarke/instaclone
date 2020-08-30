class ProfileController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
  end

  private
  def profile_params
      params.require(:profile).permit(:first_name, :last_name)
  end
end
