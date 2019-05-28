class User < ApplicationRecord
  has_secure_password

  attr_accessor :remember_token

  has_many :work_experiences, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :votes, as: :voteable 

  enum role: [:manager, :member]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :fullname, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  before_save :downcase_email

  scope :login_scope, ->(text) {where("username = :text OR email = :text", text: text)}
  
  def self.digest(string)
    if (ActiveModel::SecurePassword.min_cost)
      cost = BCrypt::Engine::MIN_COST
    else
      cost = BCrypt::Engine.cost
    end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = self.new_token
    update_attribute(:remember_digest, self.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
