class TwitterManagerController < ApplicationController
  def post
    twitter_accounts = current_user.twitter_accounts
    # oauth = Twitter::OAuth.new('bKq8NGQ9RlQQWlVN2RnUg', '6fOvxl3MHqc1Rk0mjLLJZadQ9os1vEOPJFa0Brw')
    #oauth.authorize_from_access('34886455-dZAtfOfw4HZCD9Kgbl37E5Ly4ZYAUozEnTsv0A8ZE', '5bUBg8Xqp6NPGKuV7Fezekv9TWtw3OSWDr9dmj5k')
    #client = Twitter::Base.new(oauth)
    #client.update('Another test post')
    if twitter_accounts ==nil
      @error = "No accoounts added"
      return
    end
    if (params[:post_message]!=nil and params[:post_message]!="" and twitter_accounts!=nil)
      begin
        twitter_accounts.each do |account|
          account.post(params[:post_message])
        end
        redirect_to("/reader/index", :message => 'Your message has been posted.')
      rescue Twitter::Error::Forbidden => exc
        @error = exc.message
      end
    end
  end
end
