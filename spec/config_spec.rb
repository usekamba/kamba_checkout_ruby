require 'spec_helper'

describe 'KambaCheckout' do
  describe 'secret_key' do
    before(:each) do
      @default_secret_key = KambaCheckout.secret_key
      KambaCheckout.secret_key = nil
      ENV['KAMBA_SECRET_KEY'] = nil
    end

    after(:each) do
      KambaCheckout.secret_key = @default_secret_key
      KambaCheckout.api_key = @default_sec_key
    end

    it 'should set and read instance variable' do
      KambaCheckout.secret_key = '123'
      KambaCheckout.secret_key.should == '123'
    end

    it 'should fallback to ENV variable' do
      ENV['KAMBA_SECRET_KEY'] = 'checkout'
      KambaCheckout.secret_key.should == 'checkout'
    end
  end
  describe 'api_key' do
    before(:each) do
      @default_api_key = KambaCheckout.api_key
      KambaCheckout.api_key = nil
      ENV['KAMBA_API_KEY'] = nil
    end

    after(:each) do
      KambaCheckout.api_key = @default_api_key
    end

    it 'should set and read instance variable' do
      KambaCheckout.api_key = '123'
      KambaCheckout.api_key.should == '123'
    end

    it 'should fallback to ENV variable' do
      ENV['KAMBA_API_KEY'] = 'checkout'
      KambaCheckout.api_key.should == 'checkout'
    end
  end
end
