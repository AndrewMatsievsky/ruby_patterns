class User
  attr_accessor :first_name, :last_name
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
end

class UserDecorator < SimpleDelegator
  def initialize(user)
    @user = user
  end

  def full_name
    "#{@user.first_name} #{@user.last_name}"
  end
end

user = User.new("john", "doe")

user_decorator = UserDecorator.new(user)

puts user_decorator.full_name
