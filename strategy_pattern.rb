#Encapsulates an algorithm inside a class.
#Define a family of algorithms, encapsulate each one, and make them interchangeable.
#Strategy lets the algorithm vary independently from clients that use it.

class PaymentAction
  def initialize(payment_service)
    @payment_service = payment_service
  end

  def execute
    @payment_service.execute
  end
end


class PaymentService
  def execute
    puts "Abstract Payment Service execution"
  end
end

class ApplePaymentService < PaymentService
  def execute
    puts "ApplePay action executed!"
  end
end

class AndroidPaymentService < PaymentService
  def execute
    puts "AndroidPay action executed!"
  end
end


payment_action_one = PaymentAction.new(ApplePaymentService.new)
payment_action_one.execute # ApplePay action executed


payment_action_two = PaymentAction.new(AndroidPaymentService.new)
payment_action_two.execute # AndroidPay action executed!
