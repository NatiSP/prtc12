module Prtc09

    class Fraccion 
    
      def gcd(u, v)
	u, v = u.abs, v.abs
	  while v != 0
	u, v = v, u % v
	  end
	u
      end
  
      include Comparable
      attr_accessor :n,:d
    
      def initialize(n,d)
	@n = n/gcd(n,d)
	@d = d/gcd(n,d)    
      end
    
    def num()
      @n
    end
  
    def denom()
      @d
    end
    
    def to_s()
      "#@n/#@d"
    end
    
    def to_float()
      (@n.to_f()/@d.to_f())
    end
    
    def abs()    
      if(@n < 0)
	return Fraccion.new((-1)*@n, @d)
      end    
      self
    end
    
    def reciprocal()         
	Fraccion.new(@d, @n)
    end
    
    def -@
	Fraccion.new((-1)*@n,@d)
    end
    
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
    
      def *(other)
	if !(other.is_a? Fraccion)
          Fraccion.new(@n*other, @d)
        else
	  Fraccion.new(@n*other.n,@d*other.d)
	end
      end
    
      def /(other)
	  Fraccion.new(@n*other.d,@d*other.n)
      end
    
      def %(other)
	return (@n*other.d) % (@d*other.n)
      end
  
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
    
    def coerce(other)
        [Fraccion.new(other, 1), self]
    end
    
    end
    
end