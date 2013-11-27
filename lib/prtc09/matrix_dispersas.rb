require "prtc09/matrix"


module Prtc09


class Matrix_Dispersa < Matrix

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

    def initialize(filas_dis, columnas_dis)
      super(filas_dis, columnas_dis)
      @matrix_d = Hash.new(cero)
    end
    
    def [](filas_dis, columnas_dis)
	@matrix_d[AccHash.new(filas_dis, columnas_dis)]
    end

    def []=(filas_dis, columnas_dis, valor)
      if valor != cero
	@matrix_d[AccHash.new(filas_dis, columnas_dis)] = valor
      else
	@matrix_d.delete(AccHash.new(filas_dis, columnas_dis))
      end
    end
end

end