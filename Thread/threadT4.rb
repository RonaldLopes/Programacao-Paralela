#!/usr/bin/ruby
require 'thread'

mutexIcognita = Mutex.new
mutexSomatorio = Mutex.new
resource = ConditionVariable.new
def calculaIcognita(matrixIcognita,matrixCoeficiente,matrixResultado,mutexIcognita,somatorio,cv)
    mutexIcognita.synchronize do
        
        (0..(matrixIcognita.length-1)).reverse_each do |i|
            # puts i
            cv.wait(mutexIcognita)    
            #puts "Calculando X#{i}..., somatorio: #{somatorio}"
             
            matrixIcognita[i] = (matrixResultado[i] - somatorio)/matrixCoeficiente[i][i]
            
            cv.signal
        end
        puts "Matriz icognitas: #{matrixIcognita}"
    end
end
def calculaSomatorio(matrixCoeficiente,matrixIcognita,somatorio,mutexSoma,cv)
    
    mutexSoma.synchronize do
        
        (0..(matrixIcognita.length-1)).reverse_each do |i| 
            cv.signal
            
            if (i+1) > (matrixCoeficiente.length-1)
                somatorio = 0   
                #puts "ola > X#{i}"           
            else
                somatorio = 0 
                ((i+1)..(matrixCoeficiente.length-1)).reverse_each do |j|
                    somatorio = somatorio + (matrixCoeficiente[i][j] * matrixIcognita[j]) 
                    #puts "i+1 > #{i+1} > X#{i}"
                    
                end
                # puts "Valor de i : #{i+1}, i+1 = #{(i+1)}, somatorio: #{somatorio[i]}"
                # puts somatorio
            end
            ##puts "i>#{i} somatorio>#{somatorio}"
            cv.wait(mutexSoma)
            somatorio = 0
            # puts somatorio
        end
    end
end

matrixCoeficiente = [[1.0,2.0,2.0,4.0],[0.0,1.0,4.0,8.0],[0.0,0.0,2.0,4.0],[0.0,0.0,0.0,2.0]]#[[1.0,2.0,3.0],[0.0,4.0,-5.0],[0.0,0.0,6.0]]#[[3,1,0],[0,2,-1],[0,0,3]] #[[1,2,3,4],[0,5,6,7],[0,0,8,9],[0,0,0,10]] #
matrixIcognita = [0.0,0.0,0.0,0.0]
matrixResultado = [10.0,4.0,8.0,10.0]#[14.0,23.0,18.0]#[4,2,0] #[5,4,4,2]#
somatorio = 0.0



thread = []
thread << Thread.new{calculaIcognita(matrixIcognita,matrixCoeficiente,matrixResultado,mutexIcognita,somatorio,resource)}

thread << Thread.new{ calculaSomatorio(matrixCoeficiente,matrixIcognita,somatorio,mutexSomatorio,resource)}

thread.each &:join

