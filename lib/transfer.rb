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
    if @sender > @amount
      @sender -= @amount
      @receiver += @amount
      @status = "completed"
    else
      @status = "Rejected"
    end
  end



end
