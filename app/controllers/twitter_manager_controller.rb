class TwitterManagerController < ApplicationController
  def post
	Twitter.configure do |config|
		config.consumer_key = 'bKq8NGQ9RlQQWlVN2RnUg'
		config.consumer_secret = '6fOvxl3MHqc1Rk0mjLLJZadQ9os1vEOPJFa0Brw'
		config.oauth_token = '34886455-dZAtfOfw4HZCD9Kgbl37E5Ly4ZYAUozEnTsv0A8ZE'
		config.oauth_token_secret = '5bUBg8Xqp6NPGKuV7Fezekv9TWtw3OSWDr9dmj5k'
  
	end
   # oauth = Twitter::OAuth.new('bKq8NGQ9RlQQWlVN2RnUg', '6fOvxl3MHqc1Rk0mjLLJZadQ9os1vEOPJFa0Brw')
	#oauth.authorize_from_access('34886455-dZAtfOfw4HZCD9Kgbl37E5Ly4ZYAUozEnTsv0A8ZE', '5bUBg8Xqp6NPGKuV7Fezekv9TWtw3OSWDr9dmj5k')
	#client = Twitter::Base.new(oauth)
	#client.update('Another test post')
	if (params[:post_message]!=nil and params[:post_message]!="")
		Twitter.update(params[:post_message])
	end
		
  end
end
