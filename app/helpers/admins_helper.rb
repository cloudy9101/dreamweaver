module AdminsHelper

  def admin_in(admin)
    cookies.permanent[:remember_token] = admin.remember_token
    current_admin = admin
  end

  # def admin_in?
  #   !current_admin.nil?
  # end

  # def admin_out
  #   self.current_user = nil
  #   cookies.delete(:remember_token)
  # end

  def current_admin=(admin)
    @current_admin = admin
  end

  def current_admin
    @current_admin ||= Admin.find_by_remember_token(cookies[:remember_token])
  end
end
