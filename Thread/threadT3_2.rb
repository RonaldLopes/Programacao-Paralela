#!/usr/bin/ruby
require 'thread'
mutexVermelho = Mutex.new
mutexVerde = Mutex.new
mutexAmarelo = Mutex.new

resource = ConditionVariable.new

# cvVermelho = ConditionVariable.new
# cvAmarelo = ConditionVariable.new
# cvVerde = ConditionVariable.new

def printRed(tempoDormir,n,proximoSinal,mutexAtual,cv)
    mutexAtual.synchronize do
        n.times do
            # cv.signal
            sleep(tempoDormir)
            
            print("Vermelho !!! dormi por #{tempoDormir} segundos....\n")
            # cv.wait(mutexAtual)
            cv.signal
            cv.wait(mutexAtual)
            
            
            
        end
    end
    
end
def printYellow(tempoDormir,n,proximoSinal,mutexAtual,cv)
    
    mutexAtual.synchronize do
        n.times do
            # cv.signal
            cv.wait(mutexAtual)
            sleep(tempoDormir)
            print "Amarelo !!! dormi por #{tempoDormir} segundos....\n"
            cv.signal
            # cv.wait(mutexAtual)
            # 
            # cv.wait(proximoSinal)  
        end
    end
    
end
def printGreen(tempoDormir,n,proximoSinal,mutexAtual,cv)
    mutexAtual.synchronize do
        n.times do
            
            cv.wait(mutexAtual)
            sleep(tempoDormir)
            print "Verde !!! dormi por #{tempoDormir} segundos....\n"
            # print ">>>>>>>>>>>>>>>>>>>>>>>>>>\n"
            cv.signal
            
        end
    end
end
puts "Informe o numero de repetições: "
repeticao = gets.to_i
thread = []
thread << Thread.new{ printRed(Random.rand(1..3),repeticao,mutexAmarelo,mutexVermelho,resource)}
thread << Thread.new{ printYellow(Random.rand(1..3),repeticao,mutexVerde,mutexAmarelo,resource)}
thread << Thread.new{ printGreen(Random.rand(1..3),repeticao,mutexVermelho,mutexVerde,resource)}

thread.each &:join
