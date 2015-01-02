require "bundler/setup"
require "dotenv"
Dotenv.load
require File.expand_path("../app", __FILE__)
app = MeetUp::App
run app