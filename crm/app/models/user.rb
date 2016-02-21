class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    full_name = family_name + given_name + ' 様'
    return full_name
    #RubyはReturnがなくても値が返ってくるので､4行目が無くても動く
  end


end
