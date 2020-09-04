class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  add_flash_types :success, :info, :warning, :danger

  # ↓どこかのタイミングで自動的に生成されたが不要
  # before_action :require_login

  # private

  # def not_authenticated
  #   redirect_to login_path, danger: t('defaults.please_login')
  # end
  # ↑ここまで

  def post_params
    params.require(:post).permit(:images)
  end
end
