class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User

  def agent?
    role == 'agent'
  end

  def client?
    role == 'client'
  end

  def salesman?
    role == 'salesman'
  end
end
