#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"
require_relative "players/player"
require_relative "players/mouse"
require_relative "players/cat"
require_relative "env/cheese"
require_relative "env/brick"
require_relative "env/menu"
require_relative "env/level"
require_relative "env/window"

window = MyWindow.new
window.show