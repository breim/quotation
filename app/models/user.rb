class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :cpf, :presence => true
  validates :name, :presence => true


  # Relacionamentos
  
  has_many :funcionaries
  has_many :companies, :through => :funcionaries

  has_many :invitations
  
  has_many :quotes


  def companies_quotations(reload=false)
    @companies_quotations = nil if reload 
    @companies_quotations ||= Invitation.where(company_id: self.id)
  end
  
  


  #PaperClip
  has_attached_file :image, :styles => {
  	:large => "100x100!" ,
  	:medium => "80x80!" ,
  	:thumb => "25x25!"
  	},
  	:default_url => :set_default_url_on_category,
  	:url  => "/images/users/:id-:basename.:style.:extension",
  	:path => ":rails_root/public/images/users/:id-:basename.:style.:extension"

  	validates_attachment :image,
  	:content_type => { :content_type => ["image/jpg", "image/gif", "image/png","image/jpeg",] },
  	:size => { :in => 0..6144.kilobytes }
    #crop_attached_file :image
    #validates_attachment_presence :image, { message: "O anuncio deve ter uma imagem de capa" }
    #----------


    def set_default_url_on_category
    	"/img/user_missing.png"
    end


end
