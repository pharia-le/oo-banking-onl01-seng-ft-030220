class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?  
  end
  
  def execute_transaction
    if sender.balance < self.amount || !valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif status != "complete"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    end
  end
  
  def reverse_transfer
    receiver.balance += self.amount
  end
  
end
