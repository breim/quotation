class Company < ActiveRecord::Base
   # Relacionamentos
   has_many :funcionaries
   has_many :users, :through => :funcionaries
   belongs_to :category

   validates :name, :presence => true
   validates :cnpj, :presence => true
   validates :cnpj,  uniqueness: true
   validates :location, :presence => true
   validates :category_id, :presence => true

end
