class UserAuthentication < ActiveRecord::Base

  # EXTENSIONS ----------------------------------------------------------------

  # UUID
  include Uuidable


  # ENUMS ---------------------------------------------------------------------

  enum :status, [:active, :inactive]

  enum :provider, {
    developer:    0,
    twitter:      1,
    # facebook:     2,
    # google:       3,
    # weibo:        4,
    # tumblr:       5,
    # github:       6,
    # pinterest:    7,
    # wechat:       8,
    # dribbble:     9,
  }
  


  # ASSOCIATIONS --------------------------------------------------------------

  belongs_to :user


  # VALIDATIONS ---------------------------------------------------------------

  validates :first_name, :last_name, :login, presence: true
  validates :first_name, :last_name, :login, length: {maximum: 250}
  


  # CLASS METHODS -------------------------------------------------------------

  def self.find_from_omniauth_data(hash)
    find_by_provider_and_user_id(hash['provider'], hash['uid'])
  end

  def self.create_from_omniauth_data(hash, user = nil)
    user ||= User.create_from_omniauth_data(hash)
    create(user_id: user.id, uid: hash['uid'], provider: hash['provider'])
  end


  # METHODS -------------------------------------------------------------------



private

end
