class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]
  before_filter :validar_usuario

  respond_to :html

  def index
    @invitations = Invitation.all
    @quote = params[:quote_id]
    @inviteds = Company.joins(:invitations).where(invitations: { quote_id: @quote })
    respond_with(@invitations)
  end


  def send_invite
    if current_user
      @quote = Quote.find(params[:quote])
      @company = Company.find(params[:id])
      @inviteds = Company.joins(:invitations).where(invitations: { quote_id: params[:quote] })
      if @quote.user_id == current_user.id
        @checar_convite = Invitation.where(:quote_id => @quote.id).where(:company_id => @company.id).first
        if @checar_convite.nil?
          @invitation = Invitation.new
          @invitation.quote_id = @quote.id
          @invitation.company_id = @company.id
          @invitation.user_id = current_user.id
          @invitation.save!
          respond_to do |format|
            format.js {render :file => "/invitations/send_invite.js.erb"}
          end
        end
      else
        redirect_to system_index_path, notice: 'Somente o usuário que criou a cotação pode realizar esta ação'
      end
    else
      redirect_to root_path,notice: 'Você precisa estar logado para realizar esta ação'
    end
  end


  def broke_invite
    @quote = Quote.find(params[:quote])
    @company = Company.find(params[:id])
    @invite = Invitation.where(:quote_id => @quote).where(:company => @company).first
    @inviteds = Company.joins(:invitations).where(invitations: { quote_id: params[:quote] })
    @invite.destroy!
    respond_to do |format|
      format.js {render :file => "/invitations/send_invite.js.erb"}
    end
  end

  def send_quotation
    redirect_to cotacoes_painel_path, notice: "Cotação enviada com sucesso."
  end


  private

  def validar_usuario
    if current_user
    else redirect_to root_path, notice: "Você precisa estar logado para realizar esta ação"

    end
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:quote_id, :company_id, :user_id)
  end
end
