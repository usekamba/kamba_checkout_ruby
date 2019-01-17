module KambaCheckout
  class << self
    def secret_key=(key)
      @secret_key= key
    end

    def secret_key
      @secret_key || ENV["KAMBA_SECRET_KEY"]
    end

    def api_key=(key)
      @api_key= key
    end

    def api_key
      @api_key || ENV["KAMBA_API_KEY"]
    end
  end
end
