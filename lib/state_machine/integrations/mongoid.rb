module StateMachine::Integrations::Mongoid
  
  class << self; attr_reader :defaults; end
  @defaults = { :action => :save, :use_transactions => false }
  
  def self.matches?(klass)
    defined?(::Mongoid::Document) && klass <= ::Mongoid::Document
  end
  
protected
  # Whether observers are supported in the integration.  Only true if
  # ActiveModel::Observer is available.
  def supports_observers?
    defined?(::ActiveModel::Observing) && owner_class <= ::ActiveModel::Observing
  end
  
  # Whether validations are supported in the integration.  Only true if
  # the ActiveModel feature is enabled on the owner class.
  def supports_validations?
    defined?(::ActiveModel::Validations) && owner_class <= ::ActiveModel::Validations
  end
  
  # Do validations run when the action configured this machine is
  # invoked?  This is used to determine whether to fire off attribute-based
  # event transitions when the action is run.
  def runs_validations_on_action?
    action == :save
  end
  
  # Whether change (dirty) tracking is supported in the integration.
  # Only true if the ActiveModel feature is enabled on the owner class.
  def supports_dirty_tracking?(object)
    defined?(::ActiveModel::Dirty) && owner_class <= ::ActiveModel::Dirty && object.respond_to?("#{self.attribute}_changed?")
  end
  
  # Defines an initialization hook into the owner class for setting the
  # initial state of the machine *before* any attributes are set on the
  # object
  def define_state_initializer
  end
  
  def i18n_scope
    :mongoid
  end
  
end
