require_relative 'util'

# Simple Queries
class Query
  def initialize
    @prompt = TTY::Prompt.new
  end

  def ratelimit(client = Octokit)
    rem = client.rate_limit['remaining']
    total = Util.new.seconds_to_str(client.rate_limit['resets_in'].to_i)
    puts "#{rem} remaining requests, Rate Limit resets in #{total}"
  end

  def authed_ratelimit
    ratelimit(@c)
  end

  def user
    getuser
  end
end
