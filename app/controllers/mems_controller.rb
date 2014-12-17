class MemsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:my]

#  before_action :set_mem, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
#    @mems = Mem.all
#    respond_with(@mems)
    @mems = Mem.active
  end

  def my
    @mems = current_user.mems
    render :index
  end

  def inactive
    @mems = Mem.inactive
    render :index
  end

  def show
    respond_with(@mem)
  end

  def new
    @mem = Mem.new
    respond_with(@mem)
  end

  def edit
  end

  def create
    @mem = current_users.mems.new(mem_params)
  #  @mem = Mem.new(mem_params)
  #  @mem.save
  #  respond_with(@mem)
  end

  def update
    @mem.update(mem_params)
    respond_with(@mem)
  end

  def destroy
    @mem.destroy
    respond_with(@mem)
  end

  private
    def set_mem
      @mem = Mem.find(params[:id])
    end

    def mem_params
      params.require(:mem).permit(:name, :description, :user_id, :image)
    end
end
