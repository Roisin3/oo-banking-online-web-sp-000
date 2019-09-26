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
    if valid? && @sender.balance > @amount.balance && @self.status == "pending"
      @sender.balance -= @amount.balance
      @receiver.balance += @amount.balance
      @status = "completed"
    else
      @status = "rejected"
    end
  end



end
