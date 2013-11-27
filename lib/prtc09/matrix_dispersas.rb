require "prtc09/matrix"


module Prtc09


class Matrix_Dispersa < Matrix

  #Clase para poder inicializar las matrices dispersas como hashes
  private
      class AccHash
	attr_accessor :fhash, :chash
	def initialize(filas_h, columnas_h)
	  @fhash, @chash = filas_h, columnas_h
	end
	
	def eql?(other)
	  @fhash == other.fhash and @chash == other.chash
	end
	
	def hash
	  @fhash.hash ^ @chash.hash
	end
	
      end

  public    
  #Inicializa la matriz dispersa como un hash
    def initialize(filas_dis, columnas_dis)
      super(filas_dis, columnas_dis)
      @matrix_d = Hash.new(cero)
    end
    
    #Funcion que devuelve el elemento [i,j] de una matriz
    def [](filas_dis, columnas_dis)
	@matrix_d[AccHash.new(filas_dis, columnas_dis)]
    end
    
    #Funcion que sirve para añadir un elemento en la posición [i,j] de una matriz
    def []=(filas_dis, columnas_dis, valor)
      if valor != cero
	@matrix_d[AccHash.new(filas_dis, columnas_dis)] = valor
      else
	@matrix_d.delete(AccHash.new(filas_dis, columnas_dis))
      end
    end
end

end