require 'littlewire'
wire = LittleWire.connect
num_pixels = ARGV.first.to_i
pin = :pin4

lit = 0
loop do
  
  text_output = ['-'] * num_pixels
  text_output[lit] = '*'
  puts text_output.join
  
  wire.ws2811(pin).send num_pixels.times.map { |idx|
    if idx == lit
      'white'.to_color
    else
      'black'.to_color
    end
  }
  
  lit += 1
  lit %= num_pixels
  
  sleep 0.005
end

