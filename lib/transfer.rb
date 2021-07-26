class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if ((status == 'pending' && sender.balance > amount) && (sender.valid? && receiver.valid?)) 
    sender.balance -= amount
    receiver.deposit(amount)
    self.status = 'complete'
    else 
    self.status = 'rejected'  
    "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if(self.status == 'complete')
      sender.deposit(amount)
      receiver.balance -= amount
      self.status = 'reversed'
    else
      'rejected'
    end
  end

end
