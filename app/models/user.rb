class User < ActiveRecord::Base
  rolify

  # Include default ldevise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

 	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :async, :omniauthable, :omniauth_providers => [:facebook]
  	has_many :posts
  	has_many :comments

  	mount_uploader :image, UserImageUploader
  	validates :username,
      :presence => true, unless: -> { from_omniauth? },
	  :uniqueness => { :case_sensitive => false }, unless: -> { from_omniauth? },
      # :format => { with: /\A[a-zA-Z]+\z/ },
      :length => { in: 4..20 }, unless: -> { from_omniauth? }

	private

	def from_omniauth?
	  provider && uid
	end

	def self.new_with_session(params, session)
		super.tap do |user|
		   if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
		     user.email = data["email"] if user.email.blank?
		   end
		end
	end

	# def self.create_with_omniauth(auth)
	#     create! do |user|
	#     user.provider = auth['provider']
	#     user.uid = auth['uid']
	#     if auth['info']
	#       user.username = auth['info']['name'] || ""
	#       user.email = auth['info']['email'] || ""
	#     end
	#   end
	# end

	  def self.from_omniauth(auth)
	    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.image = auth.info.image # assuming the user model has an image
	    # user.username = auth.info.name   # assuming the user model has a name
	    user.last_name = auth.info.last_name
	    user.first_name = auth.info.first_name
	  end
	end
end
