class User < ActiveRecord::Base
  petergate(roles: [:user, :editor, :admin])

  after_initialize :set_default_role, :if => :new_record?
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles

  def set_default_role
    self.roles ||= :user
  end

end
