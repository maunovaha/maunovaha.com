class SubscribersController < ApplicationController
  before_action :accept_html,    only: [ :activate, :cancel ]
  before_action :accept_json,    only: [ :create ]
  before_action :set_subscriber, only: [ :activate, :cancel ]

  def create
    @subscriber = Subscriber.find_by_email(subscriber_params[:email]) || 
                  Subscriber.new(subscriber_params)

    # Handles generation of random token (expires after 24 hours.)
    @subscriber.refresh_token = true unless @subscriber.active?

    if @subscriber.active?
      render json: @subscriber, status: :ok
    elsif @subscriber.save
      SubscriberMailer.confirmation_email(@subscriber).deliver_later
      render json: @subscriber, status: :created
    else
      render json: @subscriber.errors, status: :unprocessable_entity
    end
  end

  def activate
    if @subscriber.token_expired?
      render :token_expired
    else
      @subscriber.update_attribute(:active, true)
    end
  end

  def cancel
    @subscriber.update_attribute(:active, false)
  end

  private

  def set_subscriber
    @subscriber = Subscriber.find_by_id_and_token_and_email(
      params[:id],
      params[:token], 
      params[:email]
    )
  end

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end