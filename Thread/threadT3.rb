#!/usr/bin/ruby
require 'thread'
mutex = Mutex.new
resource = ConditionVariable.new


def func(numThread, tempoDormir,mutex)
    puts "Sou a Thread #{numThread} e vou dormir por #{tempoDormir} segundos...."
    Thread.current.name = "Verde"
    print(Thread.current.priority)
    puts ""
    sleep(tempoDormir)
    mutex.synchronize do
        puts("Vermelho | Thread > #{numThread}")
        puts("Amarelo | Thread > #{numThread}")
        puts("Verde | Thread > #{numThread}")
    end
end
def printRed(tempoDormir,n,mutex,cv)
    Thread.current.name ="Red"
    Thread.current.priority=-3
    
    mutex.synchronize do
        n.times do
            cv.signal
            # puts "Prioridade > #{Thread.current.priority}"
            puts "Vermelho !!! dormindo por #{tempoDormir} segundos...."
            sleep(tempoDormir)
            cv.wait(mutex)
        end
    end
    Thread.exit
end
def printYellow(tempoDormir,n,mutex,cv)
    Thread.current.name ="Yellow"
    Thread.current.priority=-2
    mutex.synchronize do
        n.times do
            cv.signal
            puts "Amarelo !!! dormindo por #{tempoDormir} segundos...."
            sleep(tempoDormir) 
            cv.wait(mutex)          
        end
    end
    Thread.exit
end
def printGreen(tempoDormir,n,mutex,cv)
    Thread.current.name ="Verde"
    Thread.current.priority=-1
    mutex.synchronize do
        n.times do
            cv.signal
            puts "Verde !!! dormindo por #{tempoDormir} segundos...."
            sleep(tempoDormir)
            cv.wait(mutex)
        end
    end
    Thread.exit
end
puts "Informe o numero de repetições: "
repeticao = gets.to_i

thread = []
thread << Thread.new{printRed(Random.rand(1..10),repeticao,mutex,resource)}
thread << Thread.new{ printYellow(Random.rand(1..10),repeticao,mutex,resource)}
thread << Thread.new{ printGreen(Random.rand(1..10),repeticao,mutex,resource)}

thread.each do |t|
    
    t.join
    
end