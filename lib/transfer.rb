class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount.balance && self.status == "pending"
      sender.balance -= amount.balance
      receiver.balance += amount.balance
      self.status = "completed"
    else
      self.status = "Transaction rejected. Please check your account balance."
    end
  end



end
