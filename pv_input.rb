require 'pry'
require 'dino'

board = Dino::Board.new(Dino::TxRx.new)

sensor = Dino::Components::Sensor.new(pin: 'A0', board: board)
led = Dino::Components::Led.new(pin: 13, board: board)

on_data = Proc.new do |data|
  if data.to_i < 270
    led.off
  else
    led.on
  end
end

sensor.when_data_received(on_data)

sleep
