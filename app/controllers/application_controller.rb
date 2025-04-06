class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # 開発環境の時CSRFﾄｰｸﾝをｽｷｯﾌﾟする設定。有効の場合開発環境ではerrorとなる事多い
  if Rails.env.development?
    skip_before_action :verify_authenticity_token
  end
end
