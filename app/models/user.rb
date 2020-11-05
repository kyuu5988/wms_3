class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  validates :name, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :group

end
