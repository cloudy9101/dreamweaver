class AdminsController < ApplicationController
  include AdminsHelper
  before_action :authenticate_admin, except: [:log_in, :session_create]
  layout 'admin'

  def index
  end

  def targets
    @targets = Target.order(created_at: :desc).all.paginate(page: params[:page], per_page: 20)
  end

  def delete_target
    @target = Target.find(params[:target_id])
    @target.destroy
    redirect_to targets_admins_path
  end

  def abstract_targets
    @abstract_targets = AbstractTarget.order(created_at: :desc).all.paginate(page: params[:page], per_page: 20)
  end

  def delete_abstract_target
    @at = AbstractTarget.find(params[:abstract_target_id])
    @at.destroy
    redirect_to abstract_targets_admins_path
  end

  def users
    @users = User.order(created_at: :desc).all.paginate(page: params[:page], per_page: 20)
  end

  def delete_user
    @user = User.find(params[:user_id])
    @user.destroy
    redirect_to users_admins_path
  end

  def log_in
  end

  def session_create
    admin = Admin.find_by(name: params[:admin][:name])
    if admin && admin.authenticate(params[:admin][:password])
      admin_in admin
      redirect_to admins_path
    else
      flash.now[:red] = "用户名或密码不正确"
      render 'log_in'
    end
  end

  def log_out
    self.current_admin = nil
    cookies.delete(:remember_token)
    
    redirect_to log_in_admins_path
  end

  def change_category
    @abstract_target = AbstractTarget.find(params[:a_t])
    @abstract_target.update(category_id: params[:abstract_target][:category_id])
    redirect_to abstract_targets_admins_path
  end

  def mark_great
    @abstract_target = AbstractTarget.find(params[:a_t])
    @abstract_target.toggle(:great).save
    redirect_to abstract_targets_admins_path
  end

  private
    # def admin_in(admin)
    #   cookies.permanent[:remember_token] = admin.remember_token
    #   current_admin = admin
    # end

    def authenticate_admin
      if current_admin.nil?
        redirect_to log_in_admins_path
      end
    end
end
