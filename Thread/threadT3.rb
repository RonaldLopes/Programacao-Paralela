#!/usr/bin/ruby
mutex = Mutex.new

def func(numThread, tempoDormir,mutex)
    puts "Sou a Thread #{numThread} e vou dormir por #{tempoDormir} segundos...."
    sleep(tempoDormir)
    mutex.synchronize do
        puts("Vermelho | Thread > #{numThread}")
        puts("Amarelo | Thread > #{numThread}")
        puts("Verde | Thread > #{numThread}")
    end
end

puts "Informe o numero de repetições: "
repeticao = gets.to_i

thread = []

repeticao.times do |numero|
    thread << Thread.new{ func(numero,Random.rand(1..10),mutex)}
end

thread.each do |t|
    t.join()
end