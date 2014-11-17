class Quote < ActiveRecord::Base

	belongs_to :user
	belongs_to :company




	has_many :invitations
    has_many :companies, :through => :invitations

	
	has_many :itens
	accepts_nested_attributes_for :itens, :reject_if => :all_blank, :allow_destroy => true

	validates :name, length: { in: 2..40 }
  	validates :description, length: { maximum: 400 }
	validates :name, :presence => true
	validates :company_id, :presence => true
	validates :prazo_de_resposta,:presence => true
	
	validates :prazo_de_resposta,
			   date: { after: Date.today }
end


# current_user.quotes.joins(:invitations).where('funcionary.user_id = 1')