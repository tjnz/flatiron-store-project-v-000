class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  
  def current_cart=(cart)
    self.carts << cart if cart
    cart
  end
  
  def current_cart
    if self.carts.last
      self.carts.last 
    end
  end
  
  def last_cart
    self.carts.last
  end
  
  def create_current_cart
    self.carts.create
  end
  
end
