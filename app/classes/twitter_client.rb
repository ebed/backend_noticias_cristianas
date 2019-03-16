class TwitterClient
    def self.connect 
        Twitter::REST::Client.new do |config|
            config.consumer_key        = "jpVXLCorPzuQhRIawh9ANQCMn"
            config.consumer_secret     = "X74UYZw7QckDA6pQK376tlI5TetmkxmABOnzVcyDMnnf2Dee8a"
            config.access_token        = "15651135-mC2jkrhGrCNghZrPMsByesaiXduFpQCfnWMwfU6RZ"
            config.access_token_secret = "aBGNs3QUz3pujPxxrSrOPmTL3cLMGp7hoS3PJqcqsK7k0"
        end
    end

 
end