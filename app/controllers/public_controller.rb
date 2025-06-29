class PublicController < ApplicationController
  layout 'public_profile', only: [:profile]

  def index; end
  def terms; end
  def policy; end
  def cookies; end

  def profile
    @user = User.find_by(directory: params[:directory])
    # If @user is nil, the view will render the claim form as the "404" state
  end
end