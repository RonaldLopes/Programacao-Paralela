#!/usr/bin/ruby
require 'thread'

mutexIcognita = Mutex.new
mutexSomatorio = Mutex.new
resource = ConditionVariable.new
queue = Queue.new

def calculaIcognita(matrixIcognita,matrixCoeficiente,matrixResultado,mutexIcognita,cv,queue)
    mutexIcognita.synchronize do
        (0..(matrixIcognita.length-1)).reverse_each do |i|
            cv.wait(mutexIcognita)
            matrixIcognita[i] = (matrixResultado[i] - queue.pop)/matrixCoeficiente[i][i]
            cv.signal
        end
        puts "Matriz icognitas: #{matrixIcognita}"
    end
end

def calculaSomatorio(matrixCoeficiente,matrixIcognita,mutexSoma,cv,queue)
    
    mutexSoma.synchronize do
        (0..(matrixIcognita.length-1)).reverse_each do |i| 
            cv.signal
            if (i+1) > (matrixCoeficiente.length-1)
                somatorio = 0         
            else
                somatorio = 0 
                ((i+1)..(matrixCoeficiente.length-1)).reverse_each do |j|
                    somatorio = somatorio + (matrixCoeficiente[i][j] * matrixIcognita[j]) 
                end
            end
            queue << somatorio
            cv.wait(mutexSoma)
            somatorio = 0
        end
    end
end

matrixCoeficiente = [[1.0,2.0,3.0],[0.0,4.0,5.0],[0.0,0.0,6.0]]#[[1.0,2.0,2.0,4.0],[0.0,1.0,4.0,8.0],[0.0,0.0,2.0,4.0],[0.0,0.0,0.0,2.0]]#[[3,1,0],[0,2,-1],[0,0,3]] #[[1,2,3,4],[0,5,6,7],[0,0,8,9],[0,0,0,10]] #
matrixIcognita = [0.0,0.0,0.0]
matrixResultado =[14.0,23.0,18.0]# [10.0,4.0,8.0,10.0]#[4,2,0] #[5,4,4,2]#




thread = []
thread << Thread.new{calculaIcognita(matrixIcognita,matrixCoeficiente,matrixResultado,mutexIcognita,resource,queue)}

thread << Thread.new{ calculaSomatorio(matrixCoeficiente,matrixIcognita,mutexSomatorio,resource,queue)}

thread.each &:join

