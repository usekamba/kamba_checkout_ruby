module KambaCheckout
  class Response
    attr_accessor :signature, :time, :environment, :checkout_config, :api_key, :channel, :initial_amount, :notes, :redirect_url_success
    def initialize(environment, checkout, signature, time)
      @environment = environment
      @channel = checkout['channel']
      @initial_amount = checkout['initial_amount']
      @notes = checkout['notes']
      @redirect_url_success = checkout['redirect_url_success']
      @signature = signature
      @time = time
      @api_key = KambaCheckout.api_key
    end
  end
end
