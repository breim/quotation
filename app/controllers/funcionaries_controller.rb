class FuncionariesController < ApplicationController
  before_action :set_funcionary, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @funcionaries = Funcionary.all
    respond_with(@funcionaries)
  end

  def show
    respond_with(@funcionary)
  end

  def new
    @funcionary = Funcionary.new
    respond_with(@funcionary)
  end

  def edit
  end

  def create
    @funcionary = Funcionary.new(funcionary_params)
    @funcionary.save
    respond_with(@funcionary)
  end

  def update
    @funcionary.update(funcionary_params)
    respond_with(@funcionary)
  end

  def destroy
    @funcionary.destroy
    respond_with(@funcionary)
  end

  private
    def set_funcionary
      @funcionary = Funcionary.find(params[:id])
    end

    def funcionary_params
      params.require(:funcionary).permit(:company_id, :user_id)
    end
end
