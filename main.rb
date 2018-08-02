# -*- encoding: utf-8 -*-
require 'discordrb'

TOKEN = 'TOKEN' #Discordアプリのトークン
CLIENT_ID = 5412514232146542641  #DiscordアプリのクライアントID
VOICE_CHANNEL = 415462465221504126 #接続する音声チャンネルのID
VOLUME = 1  #再生音量

$BOT = Discordrb::Bot.new token:TOKEN, client_id:CLIENT_ID


$BOT.message start_with:("play") do |event|
    $voice.filter_volume = (VOLUME)
    $voice.play_file('play.mp3')
end

$BOT.message start_with:("connect") do |event|
    $voice = $BOT.voice_connect(VOICE_CHANNEL)
    $voice.filter_volume = (VOLUME)
    $voice.play_file('start.mp3')
end

$BOT.message start_with:("reconnect") do |event|
    $voice.destroy
    $voice = $BOT.voice_connect(VOICE_CHANNEL)
    $voice.play_file('start.mp3')
end

$BOT.message start_with:("stop") do |event|
    $voice.stop_playing
end


begin
    $BOT.run
rescue
    #nil
end