module StateMachine::Integrations::Mongoid
  
  class << self; attr_reader :defaults; end
  @defaults = { :action => :save, :use_transactions => false }
  
  def self.matches?(klass)
    defined?(::Mongoid::Document) && klass <= ::Mongoid::Document
  end
  
protected
  
  # Defines an initialization hook into the owner class for setting the
  # initial state of the machine *before* any attributes are set on the
  # object
  def define_state_initializer
  end
  
  def i18n_scope
    :mongoid
  end
  
end
