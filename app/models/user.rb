class User < ActiveRecord::Base
  petergate(roles: [:user, :editor, :admin])
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :articles, dependent: :destroy
end
