#!/usr/bin/ruby
require 'thread'
mutex = Mutex.new
resource = ConditionVariable.new

def printRed(tempoDormir,n,mutex,cv)
    Thread.current.priority=1
    Thread.current.name ="Red"
    
    mutex.synchronize do
        n.times do
            cv.signal
            sleep(tempoDormir)
            print("Vermelho !!! dormi por #{tempoDormir} segundos....\n")
            
            cv.wait(mutex)
        end
    end
    
end
def printYellow(tempoDormir,n,mutex,cv)
    
    Thread.current.name="Yellow"
    Thread.current.priority=2
    mutex.synchronize do
        n.times do
            cv.signal
            sleep(tempoDormir)
            print "Amarelo !!! dormi por #{tempoDormir} segundos....\n"
             
            cv.wait(mutex)          
        end
    end
    
end
def printGreen(tempoDormir,n,mutex,cv)
    
    Thread.current.name ="Verde"
    Thread.current.priority=3
    mutex.synchronize do
        n.times do
            cv.signal
            sleep(tempoDormir)
            print "Verde !!! dormi por #{tempoDormir} segundos....\n"
            
            cv.wait(mutex)
        end
    end
   
end
puts "Informe o numero de repetições: "
repeticao = gets.to_i

thread = []
mutex.synchronize do
    thread << Thread.new{ Thread.stop;printRed(Random.rand(1..10),repeticao,mutex,resource)}
    thread << Thread.new{  Thread.stop;printYellow(Random.rand(1..10),repeticao,mutex,resource)}
    thread << Thread.new{  Thread.stop;printGreen(Random.rand(1..10),repeticao,mutex,resource)}
end

sleep(1)
thread.each do |t|
    t.run
end
thread[0].join
