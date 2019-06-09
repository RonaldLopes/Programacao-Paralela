#!/usr/bin/ruby

def func (numThread, tempoDormir)
	puts "Eu sou a Thread #{numThread} e vou dormir por #{tempoDormir} segundos!"
	sleep(tempoDormir)
	puts "Eu sou a Thread #{numThread}. Já se passaram #{tempoDormir} segundos e eu serei finalizada!"
end
threads = []
4.times do |numero|
	threads << Thread.new{func(numero, Random.rand(1..20))}
end
threads.each do |t|
	t.join
end
