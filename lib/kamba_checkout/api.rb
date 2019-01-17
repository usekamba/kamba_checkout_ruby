module KambaCheckout
  class API
    def self.generate_checkout(environment, checkout)
      time = Time.now.httpdate
      secret_key = KambaCheckout.secret_key

      json_string = checkout.to_json
      canonical_string = "POST,application/json,#{generate_md5(json_string)},#{'/v1/checkouts'},#{time}"
      digest = OpenSSL::Digest.new('sha1')

      hmac_signature = OpenSSL::HMAC.digest(digest, secret_key, canonical_string)
      signature = Base64.strict_encode64(hmac_signature)
      KambaCheckout::Response.new(environment, checkout, signature, time)
    end

    private

    def self.generate_md5(checkout)
      Digest::MD5.base64digest(checkout)
    end
  end
end
