# frozen_string_literal: true

require 'figlet'
require 'yaml/store'

# Some ultra cool figlets
class Fig
  def initialize
    @store = YAML::Store.new(File.expand_path('../../../assets/data.yml', __dir__))
    @font = Figlet::Font.new(File.expand_path('../../../assets/fonts/big.flf', __dir__))
    @figlet = Figlet::Typesetter.new(@font)
    @user = @store.transaction { @store[:user] }
  end

  def roprquest
    puts @figlet['ROPRQuest 2018!']
  end

  def user
    puts @figlet[@user.to_s]
  end

  def ropr_user
    puts @figlet["#{@user} ROPRQuest"]
  end

  def user_message(message)
    puts @figlet["#{@user} #{message}"]
  end
end
