class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @quotes = Quote.all
    respond_with(@quotes)
  end

  def show
    respond_with(@quote)
  end

  def new
    @quote = Quote.new
    respond_with(@quote)
  end

  def painel
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    @quote.user_id = current_user.id
    @quote.save
    respond_with(@quote)
  end

  def update
    @quote.update(quote_params)
    redirect_to quotes_path
  end

  def destroy
    @quote.destroy
    respond_with(@quote)
  end

  private
  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name, :description, :prazo_de_resposta,:company_id, :user_id, itens_attributes: [:id, :name,:amount,:part_number, :_destroy])
  end
end
