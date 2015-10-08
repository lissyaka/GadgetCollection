class GadgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_gadget, except: [:index, :create, :new]

  def index
    @gadgets = current_user.gadgets
  end

  def create
    @gadget = Gadget.new gadget_params.merge(user_id: current_user.id)
    if @gadget.save
      redirect_to gadgets_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    @gadget.update gadget_params
    if @gadget.save
      redirect_to gadgets_path
    else
      render :edit
    end
  end

  def new
    @gadget = Gadget.new 
  end

  def destroy
    @gadget.destroy
    redirect_to gadgets_path
  end

  def show
  end

  private

  def fetch_gadget
    @gadget = Gadget.find params[:id]
  end

  def gadget_params
    params.require(:gadget).permit(:title)
  end
end
