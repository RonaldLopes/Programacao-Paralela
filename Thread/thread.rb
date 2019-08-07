#Ronald - Diniz
#!/usr/bin/ruby

def imprimeFrase1
   5.times do
      puts "Programação Paralela - executado em #{Time.now.strftime("%H:%M:%S")}"
      sleep(1)
   end 
end

def imprimeFrase2
   5.times do
      puts "Instituto Federal Fluminense - executado em #{Time.now.strftime("%H:%M:%S")}"
      sleep(1)
   end
end

puts "Iniciado em #{Time.now.strftime("%H:%M:%S")}"

thread1 = Thread.new{imprimeFrase1}
thread2 = Thread.new{imprimeFrase2}

thread1.join
thread2.join
puts "Finalizado em #{Time.now.strftime("%H:%M:%S")}"
