#!/usr/bin/ruby
require 'thread'
mutexVermelho = Mutex.new
mutexVerde = Mutex.new
mutexAmarelo = Mutex.new

resource = ConditionVariable.new

def printRed(tempoDormir,n,mutexAtual,cv)
    mutexAtual.synchronize do
        n.times do
            sleep(tempoDormir)
            print("Redi !!! dormi por #{tempoDormir} segundos....\n")
            cv.signal
            cv.wait(mutexAtual)  
        end
    end
    
end
def printYellow(tempoDormir,n,mutexAtual,cv)
    
    mutexAtual.synchronize do
        n.times do
            cv.wait(mutexAtual)
            sleep(tempoDormir)
            print "Yellou !!! dormi por #{tempoDormir} segundos....\n"
            cv.signal
        end
    end
    
end
def printGreen(tempoDormir,n,mutexAtual,cv)
    mutexAtual.synchronize do
        n.times do
            cv.wait(mutexAtual)
            sleep(tempoDormir)
            print "Green !!! dormi por #{tempoDormir} segundos....\n"
            cv.signal
        end
    end
end
puts "Informe o numero de repetições: "
repeticao = gets.to_i
thread = []
thread << Thread.new{ printRed(Random.rand(1..10),repeticao,mutexVermelho,resource)}
thread << Thread.new{ printYellow(Random.rand(1..10),repeticao,mutexAmarelo,resource)}
thread << Thread.new{ printGreen(Random.rand(1..10),repeticao,mutexVerde,resource)}

thread.each &:join
