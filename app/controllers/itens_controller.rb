class ItensController < ApplicationController
  before_action :set_iten, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @itens = Iten.all
    respond_with(@itens)
  end

  def show
    respond_with(@iten)
  end

  def new
    @iten = Iten.new
    respond_with(@iten)
  end

  def edit
  end

  def create
    @iten = Iten.new(iten_params)
    @iten.save
    respond_with(@iten)
  end

  def update
    @iten.update(iten_params)
    respond_with(@iten)
  end

  def destroy
    @iten.destroy
    respond_with(@iten)
  end

  private
    def set_iten
      @iten = Iten.find(params[:id])
    end

    def iten_params
      params.require(:iten).permit(:name, :amount, :part_number, :quote_id)
    end
end
