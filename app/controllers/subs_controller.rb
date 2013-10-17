class SubsController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update]
  before_filter :sub_belongs_to_current_user, :only => [:edit, :update]

  def new
    @sub = Sub.new
    5.times do
      @sub.links.build
    end

    render :new
  end

  def create
    @sub = current_user.subs.build(params[:sub])

    params[:links].values.each do |link_params|
      next if link_params.all? { |k, v| v == "" }
      @sub.links.build(link_params)
    end

    if @sub.save
      redirect_to @sub
    else
      flash.now[:errors] = @sub.errors.full_messages
      (5-@sub.links.length).times do
        @sub.links.build
      end
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update_attributes(params[:sub])
      redirect_to @sub
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.includes(:links).find(params[:id])
    render :show
  end


  private
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_session_url # halts request cycle
      end
    end

    def sub_belongs_to_current_user
      @sub = Sub.find(params[:id])
      unless current_user_moderates_sub?(@sub)
        flash.now[:error] = "This sub doesn't belong to you"
        render :show
      end
    end
end
