class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :invitations
  has_many :friends
  has_many :pending_invitations, class_name: 'Invitation', foreign_key: "friend_id"


end
