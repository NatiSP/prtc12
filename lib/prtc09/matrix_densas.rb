require "prtc09/matrix"

module Prtc09


class Matrix_Densa < Matrix

  #Función para inicializar en forma de array de arrays una matriz densa
    def initialize(filas_d, columnas_d)
      super
	@matrix_d = Array.new(filas_d){Array.new(columnas_d, cero)}
    end
   
    #Funcion que devuelve el elemento [i,j] de una matriz

    def [](filas_d, columnas_d)
	@matrix_d[filas_d][columnas_d]
    end

    #Funcion que sirve para añadir un elemento en la posición [i,j] de una matriz

    def []=(filas_d, columnas_d, elemento)
	@matrix_d[filas_d][columnas_d] = elemento
    end
    
end
    
end