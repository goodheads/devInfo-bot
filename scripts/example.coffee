#   DevInfo Bot
#   Crafted by Prosper
#   Integrated with Slack

_           = require 'lodash'
info        = require './info'
help        = require './help'

module.exports = (robot) ->

  robot.respond /hi|hello|sup/i, (msg) ->
    response = "Hello friend :grin: Welcome to DevInfo bot
                Enter `help` to know more about how to operate devInfoBot"
    msg.send response

  robot.respond /all/i, (msg) ->

    _.forEach info, (value, key) ->
       msg.send  "#{key} -> #{value} \n"

  robot.respond /get developer (.*)/i, (msg) ->
    devName = escape(msg.match[1])
    response = info[devName]
    if response == undefined
       response = "We don't Know you. Please gerrahia!"
    msg.send response

  #Spills out custome typingspeed bot help commands
  robot.respond /help/i, (msg) ->
    emit = help.join "\n"
    msg.send emit
