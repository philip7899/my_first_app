class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
		@tweets = Tweet.all
	end

	def create
		@tweet_to_create = Tweet.new(tweet_params)
		@tweet_to_create.save

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
	end

	def tweet_params
		return params.require("tweet").permit("content")
	end
end
