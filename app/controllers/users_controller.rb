class UsersController < Clearance::UsersController
  before_filter :require_login, :authorize_admin, only: [:new, :create]

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end
end
