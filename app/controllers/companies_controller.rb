class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @companies = Company.all
    respond_with(@companies)
  end

  def show
    respond_with(@company)
  end

  def usercompanies
    @companies = Company.where(:user_id => current_user.id)
    @user = current_user
    @teste = Company.all
  end

  def search
      if params[:quote_id]
        @quote = params[:quote_id]
      end
      @companies = Company.search params[:search]
      respond_to do |format|
        format.js {render :file => "/companies/search.js.erb"}
      end
  end



  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    @company.save
    redirect_to  user_companies_path, :notice => 'Empresa cadastrada com sucesso !'
  end

  def update
    @company.update(company_params)
    redirect_to  user_companies_path, :notice => 'Empresa atualizada com sucesso !'
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :cnpj, :category_id, :location, :latitude, :longitude,:user_id)
  end
end
