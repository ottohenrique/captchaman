class CaptchasController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def show
    render text: 'ok'
  end

  def create
    captcha = Captcha.create(captcha_params)
    while captcha.code.blank?
      sleep 5
      captcha.reload
    end

    render json: { code: captcha.code }, status: 200
  end

  private

  def captcha_params
    params.permit(:image, :external_id)
  end
end
