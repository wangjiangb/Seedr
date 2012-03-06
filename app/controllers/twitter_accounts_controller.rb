class TwitterAccountsController < ApplicationController
  def index
    @twitter_accounts = current_user.twitter_accounts
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @search_bin }
    end
  end
  def new
    twitter_account = TwitterAccount.create({:user=>current_user})
    redirect_to(twitter_account.authorize_url(twitter_callback_url))
  end
 
  def destroy
    @twitter_accounts = TwitterAccount.find(params[:id])
    @twitter_accounts.destroy

    respond_to do |format|
      format.html { redirect_to twitter_account_url }
      format.json { head :ok }
    end
  end 

  def callback
    if params[:denied] && !params[:denied].empty?
        redirect_to(:root, :alert => 'Unable to connect with twitter: #{parms[:denied]}')
    else
      twitter_account = TwitterAccount.find_by_oauth_token(params[:oauth_token])
      twitter_account.validate_oauth_token(params[:oauth_verifier], twitter_callback_url)
      twitter_account.save
      if twitter_account.active?
          redirect_to(:root, :notice => 'Twitter account activated!')
      else
          redirect_to(:root, :notice => "Unable to activate twitter account.")
      end
    end
  end
end
