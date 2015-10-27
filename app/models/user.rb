class User < ActiveRecord::Base
  has_secure_password

  before_create { generate_token(:auth_token)}

  # 要求下面的字段用户在注册时必须填写
  validates :name, :email, presence:true

  # 保证用户注册时，下面字段的唯一性，并且忽略大小写
  validates :name, :email, uniqueness: {case_sensitive:false}

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
