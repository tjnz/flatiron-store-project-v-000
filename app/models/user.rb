class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  
  def current_cart=(cart)
  	self.carts << cart
    cart
  end
  
  def current_cart
    if self.carts
      self.carts.last
    end
  end
  
end
