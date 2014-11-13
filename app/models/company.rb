class Company < ActiveRecord::Base
   # Relacionamentos
   has_many :funcionaries
   has_many :users, :through => :funcionaries

   belongs_to :category
   has_many :quotes

   validates :name, :presence => true
   validates :name, length: { in: 2..40 }
   validates :cnpj, length: { in: 10..20 }
   validates :cnpj, :presence => true
   validates :cnpj,  uniqueness: true
   validates :location, :presence => true
   validates :category_id, :presence => true


   after_create :add_user_funcionaries
   def add_user_funcionaries
   	@funcionary = Funcionary.new
   	@funcionary.user_id = current_user.id
   	@funcionary.company_id = self.id
   	@funcionary.authorized = true
   	@funcionary.save!
   end

end
