class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_secure_password


  validates :password, length: { minimum: 6 }, on: :create

  validates :email,
    presence: true,
    uniqueness: true,
    format: {
      with: /@/,
      message: "not a valid format"
    }

    #creates unique username for each user
    def generate_username
      num = Random.new.rand(10...100)
      "#{self.first_name[0]}#{self.last_name}#{num}"
    end

end
