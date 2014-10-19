class TweetsController < ApplicationController

	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
		@tweets = Tweet.all
	end

	def create
		@tweet_to_create = Tweet.new(tweet_params)
		@tweet_to_create.user = current_user

		if @tweet_to_create.save
			flash.now["success"] = "You have created a tweet"
		else
			flash.now["danger"] = "Please review the errors below."
		end




		@tweet = Tweet.new

		@tweets = Tweet.all

		print "the tweet is " + @tweet.inspect.to_s

		render 'new'
	end

	def edit
	end

	def show
	end



	def index
		@users = User.all.reject{|user| user == current_user}
	end




	def tweet_params
		return params.require("tweet").permit("content")
	end
end
