module KambaCheckout
  class Response
    attr_accessor :signature, :time, :environment, :checkout_config
    def initialize(environment, checkout_config, signature, time)
      @environment = environment
      @checkout_config = checkout_config
      @signature = signature
      @time = time
    end
  end
end
