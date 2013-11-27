module Prtc09

  class Matrix
    
    include Enumerable
	attr_reader :filas, :columnas
	#Función para inicializar las filas y las columnas
	  def initialize(filas, columnas)
	    @filas = filas
	    @columnas = columnas
	  end
	  #Devuelve filas
	  def filas
	    return @filas
	  end
	  #Devuelve columnas
	  def columnas	    
	    return @columnas
	  end
	 
	  #Funcion para sumar matrices
	  def +(other)
	    
	    if (other.columnas == self.columnas && other.filas == self.filas)	      
	      suma = self.class.new(self.filas,self.columnas)	    
	    self.filas.times do |i| 
	      self.columnas.times do |j|		
		suma[i,j] = self[i,j] + other[i,j]
	      end
	    end
	      suma
	    else 
	      puts "No se puede sumar, las matrices no tienen las mismas dimensiones!"
	    end
	    
	  end
	  
  	  #Funcion para restar matrices

	  def -(other)
	    	    
	    if ((other.columnas == self.columnas) && (other.filas == self.filas))	      
	      resta = self.class.new(self.filas,self.columnas)	    
	    for i in 0...self.filas
	      for j in 0...self.columnas		
		resta[i,j] = self[i,j] - other[i,j]
	      end
	    end
	      resta
	    else 
	      puts "No se puede restar, las matrices no tienen las mismas dimensiones!"
	    end
	    
	  end
	  
	  #Funcion para multiplicar matrices

	  def *(other)

	    mul = self.class.new(filas, other.columnas)        
	      for i in (0...mul.filas)
		for j in (0...mul.columnas)
		  mul[i,j] = (self[i,j] * other[i,j])
		  for k in (1...self.columnas)
		    mul[i,j] = mul[i,j] + (self[i,k] * other[k,j])
		  end
		end
	      end
	      mul

	  end

	  #Funcion para imprimir en forma de cadena una matriz
	  
	  def to_s
      
	    for i in (0...filas)
	      for j in (0...columnas)
		puts "#{self[i,j]}"
		puts " "
		  if j == @columnas
		      puts "\n"
		  end
	      end
	    end
	    
	  end
         
	  #Funcion para comprobar la igualdad entre matrices

	  def ==(other)
	        
	    for i in (0...self.filas)
	      for j in (0...self.columnas)
		if self[i,j] != other[i,j]
		  return false
		end
	      end
	    end
	    	  return true
	  end
	 
	  #Funcion para comprobar el mayor elemento de una matriz

	  def max 
	    mmax = self[0,0] 
	    self.filas.times do |i| 
	      self.columnas.times do |j|
		if(self[i,j] > mmax) 
		  mmax = self[i,j] 
		end
	      end 
	    end 
	    mmax
	  end

	  #Funcion para comprobar el menor elemento de una matriz

	  def min 
	    mmin = self[0,0] 
	    self.filas.times do |i| 
	      self.columnas.times do |j|
		if(self[i,j] < mmin) 
		  mmin = self[i,j] 
		end 
	      end 
	    end 
	    mmin 
	  end
	  

  end

end