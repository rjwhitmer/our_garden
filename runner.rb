require_relative 'config/environment'
require_relative 'lib/models/welcome_banner.rb'


welcome_banner

app = Cli.new

app.main_menu