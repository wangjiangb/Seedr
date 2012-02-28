class TwitterManagerController < ApplicationController
  def post
	Twitter.configure do |config|
		config.consumer_key = 'T4MjogVPke2JK1fHAdZnQQ'
		config.consumer_secret = 'fggi7geWvWFlx2n33MjHl8B4CWSPRHmc5eGTbMhPk'
		config.oauth_token = '14732921-pWJS3QFW9kl4VdioW2p51NyiKxesM39HBlPBJnc9u'
		config.oauth_token_secret = 'UnfvDKu7hWJgKvDQiJU9IvxkFYUWo8qQWSaDbboEk'
  
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
