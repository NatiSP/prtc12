require "prtc09/matrix"

module Prtc09
  
# Clase que implementa el Lenguaje de Dominio Espec�fico para la creaci�n y operacion de matrices.

class MatrixDSL < Matrix
  attr_accessor :op, :m, :tipomatrix, :lectura

  # M�todo initialize para definir una matriz. 
  # Este metodo recibe la operaci�n a realizar y las matrices que se usar�n en la operaci�n, as� como su tipo y como se reciben.

  def initialize(operacion, &block)
    @op = operacion
    @m = []
    @tipomatrix = "densa"
    @lectura = ""
    
    instance_eval &block

    case lectura
      when "console" then puts self
      when "file"
        then
          File.open('Matrix.txt', 'w') do |f|
            f.puts self
          end
    end
  end

  # M�todo option que usaremos para asignar el tipo de matriz que vamos a usar, o el modo de lectura usado.
  def option(opt)
    case opt
      when "densa","dispersa" then @tipomatrix = opt
      when "console","file" then @lectura = opt
    end
  end

  # A�ade una nueva matriz (array de arrays) para realizar la operaci�n. 

  def operand(n_matrix)
    aux = []
    n_matrix.each { |i| i.each { |j| aux << j } }
    
    case tipomatrix
      when "densa" then m << Matriz_densa.new(lista.size,n_matrix[0].size,aux)
      when "dispersa" then m << Matriz_dispersa.new(lista.size,n_matrix[0].size,aux)
    end
  end
end

  # Devuelve la matriz resultado.

  def to_m
	salida = "\n #{@op} \n"
	
	m.each_with_index do |opr, index|
		output << " #{index + 1}. #{opr}\n"
	end
	
	case operacion
		when "Suma" then output << "  = #{(@op[0]+@op[1]).to_s}\n\n"
		when "Resta" then output << "  = #{(@op[0]-@op[1]).to_s}\n\n"
		when "Producto" then output << "  = #{(@op[0]*@op[1]).to_s}\n\n"
	end
	
	salida
  end

end

