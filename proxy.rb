# Proxy - provide placeholder for object to control reference to it

$pin = rand

class Account
  def initialize(name, balance)
    @name, @balance = name, balance
  end

  def balance
    puts "Balance is: #{@balance}$"
  end
end

class AccountProxy
  def initialize(account, pin)
    @subject, @pin = account, pin
  end

  def balance
    check_access
    @subject.balance
  end

  private

  def check_access
    if @pin != $pin
      raise "Illegal access! Try again!"
    end
  end
end

user = Account.new('Geralt', '2000')
bank_proxy = AccountProxy.new(user, 1)

bank_proxy.balance
