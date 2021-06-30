class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ログイン済ユーザーのみにアクセスを許可する どのページでもログインしていないとログインページに飛ばされる!!
  before_action :authenticate_user!, except: [:index]

  ##roomやreservationモデルを作った時に:indexが被るからエラーになるかも


  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとintroductionとimageのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :image])
  end

end
