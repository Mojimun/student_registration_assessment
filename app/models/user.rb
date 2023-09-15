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
  def self.user_verify(id)
    user = User.find(id)
    user.varified_by_admin = true
    user.save
  end
  def self.user_delete(id)
    user = User.find(id)
    user.destroy
  end
  def self.user_update(params)
    user = User.find(params[:id])
    user.name = params[:name]
    user.dob = params[:dob]
    user.address = params[:address]
    user.save
  end
  
end
