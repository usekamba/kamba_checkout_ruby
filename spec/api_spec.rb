describe 'KambaCheckout::API' do
  describe 'Generating Signature' do
    before(:each) do
      @checkout = {
        'channel'=>'WEB',
        'initial_amount'=>5500,
        'notes'=> 'Alguma note exemplo.',
        'redirect_url_success'=> 'http://amarildolucas.com/curso/aplicativo-movel-com-swift/sucesso'
      }
      KambaCheckout.secret_key = '123'
    end

    it 'should generate signature' do
      user = KambaCheckout::API.generate_signature('sandbox', @checkout)
      user.time.should == Time.now.httpdate
      user.signature.should_not == '123'
      user.environment.should == 'sandbox'
      user.checkout_config = @checkout.to_json
    end
  end
end
