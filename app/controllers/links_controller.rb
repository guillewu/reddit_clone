class LinksController < ApplicationController
  before_filter :link_belongs_to_current_user, :only => [:edit, :update, :destroy]
  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to @link
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(params[:link])
      redirect_to @link
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end


  private
    def link_belongs_to_current_user
      @link = Link.find(params[:id])
      unless current_user_owns_link?(@link)
        flash.now[:error] = "This link doesn't belong to you"
        render :show
      end
    end
end
