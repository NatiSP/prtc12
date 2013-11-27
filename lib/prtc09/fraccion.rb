module Prtc09

    class Fraccion 
    #Calcula el mayor común divisor
      def gcd(u, v)
	u, v = u.abs, v.abs
	  while v != 0
	u, v = v, u % v
	  end
	u
      end
  
      include Comparable
      attr_accessor :n,:d
    #Inicializa el numerador y el numerador de manera reducida empleando el gcd
      def initialize(n,d)
	@n = n/gcd(n,d)
	@d = d/gcd(n,d)    
      end
    #Devuelve el numerador
    def num()
      @n
    end
      #Devuelve el denominador
    def denom()
      @d
    end
    #Devuelve una cadena de la forma "numerador/denominador"
    def to_s()
      "#@n/#@d"
    end
    #Transforma en flotante el numerador y el denominador
    def to_float()
      (@n.to_f()/@d.to_f())
    end
    #Devuelve el valor absoluto de una fracción
    def abs()    
      if(@n < 0)
	return Fraccion.new((-1)*@n, @d)
      end    
      self
    end
    #Cambia el numerador por el denominador y viceversa
    def reciprocal()         
	Fraccion.new(@d, @n)
    end
    #Cambia el valor del numerador a su correspondiente negativo
    def -@
	Fraccion.new((-1)*@n,@d)
    end
    #Función que sirve para sumar una fracción con otra u otro número
    def +(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
	if(@d == other.d)
	  Fraccion.new(@n+other.n,@d)
	else
	  Fraccion.new((@n*other.d)+(@d*other.n),(@d*other.d))
	end
    end
        #Función que sirve para restar una fracción con otra u otro número
    def -(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
	if(@d == other.d)
	  Fraccion.new(@n-other.n,@d)
	else
	  Fraccion.new((@n*other.d)-(@d*other.n),(@d*other.d))
	end
    end
        #Función que sirve para multiplicar una fracción con otra u otro número
      def *(other)
	if !(other.is_a? Fraccion)
          Fraccion.new(@n*other, @d)
        else
	  Fraccion.new(@n*other.n,@d*other.d)
	end
      end
      
      #Función que sirve para dividir una fracción con otra u otro número

      def /(other)
	  Fraccion.new(@n*other.d,@d*other.n)
      end
     
      #Función que sirve para calcular el módulo entre dos fracciones

      def %(other)
	return (@n*other.d) % (@d*other.n)
      end
  
      #Función para realizar comprobaciones de mayor, menor o igual entre fracciones
      
      def <=>(other)
	  if ((@n == other.num) && (@d == other.denom))
	    return 0
	  end
	  if ((@n * other.denom) < (@d * other.num))
	    return -1
	  end
	  if ((@n * other.denom) > (@d * other.num))
	    return 1
	  end
      end

      #Función para permitir multiplicar algo por un objeto y viceversa

    def coerce(other)
        [Fraccion.new(other, 1), self]
    end
    
    end
    
end