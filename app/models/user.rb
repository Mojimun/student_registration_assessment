class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  validates :email, presence: true
  validates :name, presence: true
  validates :dob, presence: true
  validates :address, presence: true
  validates :dob, presence: true
  validate :validate_dob_format

  def validate_dob_format
    if dob.present? && !dob.is_a?(Date)
      errors.add(:dob, 'must be a valid date')
    end
  end
  def self.user_verify(params)
    ids = params[:ids]
    ids.each do |id|
      user = User.find(id)
      next if user.varified_by_admin == params[:value]
      user.varified_by_admin = params[:value]
      user.save
      # UserMailer.verified_unvarified_email(user).deliver
    end
  end
  def self.user_delete(ids)
    # puts "params=============#{ids.inspect}"
    ids.each do |id|
      user = User.find(id)
      user.destroy
    end
  end
  def self.user_add_and_update(params)
    user = User.find(params[:id]) rescue nil
    if user.nil?
      user = User.new
      user.password = params[:password].to_s.strip.gsub("-", "")
    end
    user.name = params[:name]
    user.dob = params[:dob]
    user.address = params[:address]
    if params[:avatar].present?
      user.avatar.attach(params[:avatar])
    end
    user.save
  end
end
