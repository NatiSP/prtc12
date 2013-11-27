
require "test/unit"
require "lib/prtc09"


class Enteros < Matrix_Densa 
  def cero 
    0 
  end 
end 

class Enteros_dis < Matrix_Dispersa 
  def cero 
    0
  end 
end 

class Fraccionarios < Matrix_Densa 
  def cero 
    Prtc09::Fraccion.new(0,1) 
  end 
end 

class Fraccionarios_dis < Matrix_Dispersa 
  def cero 
    Prtc09::Fraccion.new(0,1) 
  end 
end

class Prtc09::Test_MatrizDensa < Test::Unit::TestCase

  def setup
    @matriz1 = Enteros.new(2,2)
    @matriz2 = Enteros.new(2,2)
    @matriz3 = Enteros.new(2,2)
    @matriz4 = Fraccionarios.new(2,2)
    @matriz5 = Fraccionarios.new(2,2)
    @matriz6 = Fraccionarios.new(2,2)
    @matriz7 = Fraccionarios.new(2,2)

    @matriz1[0,0] = 1
    @matriz1[0,1] = 2
    @matriz1[1,0] = 3
    @matriz1[1,1] = 4

    @matriz2[0,0] = 1
    @matriz2[0,1] = 2
    @matriz2[1,0] = 3
    @matriz2[1,1] = 4

    @matriz4[0, 0] = Prtc09::Fraccion.new(0, 2)
    @matriz4[0, 1] = Prtc09::Fraccion.new(1, 2)
    @matriz4[1, 0] = Prtc09::Fraccion.new(2, 2)
    @matriz4[1, 1] = Prtc09::Fraccion.new(3, 2)
      
    @matriz5[0, 0] = Prtc09::Fraccion.new(0, 1)
    @matriz5[0, 1] = Prtc09::Fraccion.new(1, 1)
    @matriz5[1, 0] = Prtc09::Fraccion.new(2, 1)
    @matriz5[1, 1] = Prtc09::Fraccion.new(3, 1)

  end

  def test_suma

    @matriz3[0,0] = 2
    @matriz3[0,1] = 4
    @matriz3[1,0] = 6
    @matriz3[1,1] = 8
    assert_equal(@matriz3, @matriz1 + @matriz2)

    @matriz6[0,0] = Prtc09::Fraccion.new(0, 2)
    @matriz6[0,1] = Prtc09::Fraccion.new(3, 2)
    @matriz6[1,0] = Prtc09::Fraccion.new(3, 1)
    @matriz6[1,1] = Prtc09::Fraccion.new(9, 2)
    assert_equal(@matriz6, @matriz4 + @matriz5)

    @matriz7[0,0] = Prtc09::Fraccion.new(2, 1)
    @matriz7[0,1] = Prtc09::Fraccion.new(11, 2)
    @matriz7[1,0] = Prtc09::Fraccion.new(9, 1)
    @matriz7[1,1] = Prtc09::Fraccion.new(25, 2)
    assert_equal(@matriz7, @matriz3 + @matriz6)

  end


  def test_resta

    @matriz3[0,0] = 0
    @matriz3[0,1] = 0
    @matriz3[1,0] = 0
    @matriz3[1,1] = 0
    assert_equal(@matriz3, @matriz1 - @matriz2)

    @matriz6[0,0] = Prtc09::Fraccion.new(0, 2)
    @matriz6[0,1] = Prtc09::Fraccion.new(-1, 2)
    @matriz6[1,0] = Prtc09::Fraccion.new(-1, 1)
    @matriz6[1,1] = Prtc09::Fraccion.new(-3, 2)
    assert_equal(@matriz6, @matriz4 - @matriz5)

    @matriz7[0,0] = Prtc09::Fraccion.new(0, 1)
    @matriz7[0,1] = Prtc09::Fraccion.new(-1, 2)
    @matriz7[1,0] = Prtc09::Fraccion.new(-1, 1)
    @matriz7[1,1] = Prtc09::Fraccion.new(-3, 2)
    assert_equal(@matriz7, @matriz3 - @matriz6)

  end


  def test_multiplicacion

    @matriz3[0,0] = 1
    @matriz3[0,1] = 4
    @matriz3[1,0] = 9
    @matriz3[1,1] = 16
    assert_equal(@matriz3, @matriz1 * @matriz2)

    @matriz6[0,0] = Prtc09::Fraccion.new(0, 2)
    @matriz6[0,1] = Prtc09::Fraccion.new(1, 2)
    @matriz6[1,0] = Prtc09::Fraccion.new(2, 1)
    @matriz6[1,1] = Prtc09::Fraccion.new(3, 1)
    assert_equal(@matriz6, @matriz4 * @matriz5)

    @matriz7[0,0] = Prtc09::Fraccion.new(0, 2)
    @matriz7[0,1] = Prtc09::Fraccion.new(2, 1)
    @matriz7[1,0] = Prtc09::Fraccion.new(18, 1)
    @matriz7[1,1] = Prtc09::Fraccion.new(48, 1)
    assert_equal(@matriz7, @matriz3 * @matriz6)

  end

end
  
  
class Prtc09::Test_MatrizDispersa < Test::Unit::TestCase
  
  def setup
    @matriz1 = Enteros_dis.new(2,2)
    @matriz2 = Enteros_dis.new(2,2)
    @matriz3 = Enteros_dis.new(2,2)
    @matriz4 = Fraccionarios_dis.new(2,2)
    @matriz5 = Fraccionarios_dis.new(2,2)
    @matriz6 = Fraccionarios_dis.new(2,2)
    @matriz7 = Fraccionarios_dis.new(2,2)

    @matriz1[0,0] = 1
    @matriz1[0,1] = 0
    @matriz1[1,0] = 0
    @matriz1[1,1] = 0

    @matriz2[0,0] = 4
    @matriz2[0,1] = 0
    @matriz2[1,0] = 0
    @matriz2[1,1] = 0

    @matriz4[0, 0] = Prtc09::Fraccion.new(0, 1)
    @matriz4[0, 1] = Prtc09::Fraccion.new(0, 1)
    @matriz4[1, 0] = Prtc09::Fraccion.new(2, 3)
    @matriz4[1, 1] = Prtc09::Fraccion.new(0, 1)
      
    @matriz5[0, 0] = Prtc09::Fraccion.new(0, 1)
    @matriz5[0, 1] = Prtc09::Fraccion.new(0, 1)
    @matriz5[1, 0] = Prtc09::Fraccion.new(1, 1)
    @matriz5[1, 1] = Prtc09::Fraccion.new(0, 1)

  end

  def test_suma

    @matriz3[0,0] = 5
    @matriz3[0,1] = 0
    @matriz3[1,0] = 0
    @matriz3[1,1] = 0
    assert_equal(@matriz3, @matriz1 + @matriz2)

    @matriz6[0,0] = Prtc09::Fraccion.new(0, 1)
    @matriz6[0,1] = Prtc09::Fraccion.new(0, 1)
    @matriz6[1,0] = Prtc09::Fraccion.new(5, 3)
    @matriz6[1,1] = Prtc09::Fraccion.new(0, 1)
    assert_equal(@matriz6, @matriz4 + @matriz5)

    @matriz7[0,0] = Prtc09::Fraccion.new(5, 1)
    @matriz7[0,1] = Prtc09::Fraccion.new(0, 1)
    @matriz7[1,0] = Prtc09::Fraccion.new(5, 3)
    @matriz7[1,1] = Prtc09::Fraccion.new(0, 1)
    assert_equal(@matriz7, @matriz3 + @matriz6)

  end


  def test_resta

    @matriz3[0,0] = -3
    @matriz3[0,1] = 0
    @matriz3[1,0] = 0
    @matriz3[1,1] = 0
    assert_equal(@matriz3, @matriz1 - @matriz2)

    @matriz6[0,0] = Prtc09::Fraccion.new(0, 1)
    @matriz6[0,1] = Prtc09::Fraccion.new(0, 1)
    @matriz6[1,0] = Prtc09::Fraccion.new(-1, 3)
    @matriz6[1,1] = Prtc09::Fraccion.new(0, 1)
    assert_equal(@matriz6, @matriz4 - @matriz5)

    @matriz7[0,0] = Prtc09::Fraccion.new(-3, 1)
    @matriz7[0,1] = Prtc09::Fraccion.new(0, 1)
    @matriz7[1,0] = Prtc09::Fraccion.new(-1, 3)
    @matriz7[1,1] = Prtc09::Fraccion.new(0, 1)
    assert_equal(@matriz7, @matriz3 - @matriz6)

  end


  def test_multiplicacion

    @matriz3[0,0] = 4
    @matriz3[0,1] = 0
    @matriz3[1,0] = 0
    @matriz3[1,1] = 0
    assert_equal(@matriz3, @matriz1 * @matriz2)

    @matriz6[0,0] = Prtc09::Fraccion.new(0, 1)
    @matriz6[0,1] = Prtc09::Fraccion.new(0, 1)
    @matriz6[1,0] = Prtc09::Fraccion.new(2, 3)
    @matriz6[1,1] = Prtc09::Fraccion.new(0, 1)
    assert_equal(@matriz6, @matriz4 * @matriz5)

    @matriz7[0,0] = Prtc09::Fraccion.new(0, 1)
    @matriz7[0,1] = Prtc09::Fraccion.new(0, 1)
    @matriz7[1,0] = Prtc09::Fraccion.new(0, 3)
    @matriz7[1,1] = Prtc09::Fraccion.new(0, 1)
    assert_equal(@matriz7, @matriz3 * @matriz6)

  end
  
end


# Combinación de operaciones entre ambos tipos de matrices

class Prtc09::Test_MatricesDensasyDispersas < Test::Unit::TestCase
  
  def setup
    @matriz1 = Enteros.new(2,2)
    @matriz2 = Enteros_dis.new(2,2)
    @matriz3 = Fraccionarios.new(2,2)
    @matriz4 = Fraccionarios_dis.new(2,2)
    @matriz5 = Enteros.new(2,2)
    @matriz6 = Fraccionarios.new(2,2)


    @matriz1[0,0] = 1
    @matriz1[0,1] = 2
    @matriz1[1,0] = 3
    @matriz1[1,1] = 4

    @matriz2[0,0] = 4
    @matriz2[0,1] = 0
    @matriz2[1,0] = 0
    @matriz2[1,1] = 0

    @matriz3[0, 0] = Prtc09::Fraccion.new(1, 2)
    @matriz3[0, 1] = Prtc09::Fraccion.new(1, 1)
    @matriz3[1, 0] = Prtc09::Fraccion.new(3, 2)
    @matriz3[1, 1] = Prtc09::Fraccion.new(2, 1)
      
    @matriz4[0, 0] = Prtc09::Fraccion.new(0, 1)
    @matriz4[0, 1] = Prtc09::Fraccion.new(0, 1)
    @matriz4[1, 0] = Prtc09::Fraccion.new(1, 3)
    @matriz4[1, 1] = Prtc09::Fraccion.new(0, 1)

  end

  def test_suma

    @matriz5[0,0] = 5
    @matriz5[0,1] = 2
    @matriz5[1,0] = 3
    @matriz5[1,1] = 4
    assert_equal(@matriz5, @matriz1 + @matriz2)

    @matriz6[0,0] = Prtc09::Fraccion.new(1, 2)
    @matriz6[0,1] = Prtc09::Fraccion.new(1, 1)
    @matriz6[1,0] = Prtc09::Fraccion.new(11, 6)
    @matriz6[1,1] = Prtc09::Fraccion.new(2, 1)
    assert_equal(@matriz6, @matriz4 + @matriz5)

    @matriz7[0,0] = Prtc09::Fraccion.new(11, 2)
    @matriz7[0,1] = Prtc09::Fraccion.new(3, 1)
    @matriz7[1,0] = Prtc09::Fraccion.new(10, 3)
    @matriz7[1,1] = Prtc09::Fraccion.new(6, 1)
    assert_equal(@matriz7, @matriz3 + @matriz6)

  end


  def test_resta

    @matriz3[0,0] = -3
    @matriz3[0,1] = 2
    @matriz3[1,0] = 3
    @matriz3[1,1] = 4
    assert_equal(@matriz3, @matriz1 - @matriz2)

    @matriz6[0,0] = Prtc09::Fraccion.new(1, 2)
    @matriz6[0,1] = Prtc09::Fraccion.new(1, 1)
    @matriz6[1,0] = Prtc09::Fraccion.new(7, 3)
    @matriz6[1,1] = Prtc09::Fraccion.new(2, 1)
    assert_equal(@matriz6, @matriz4 - @matriz5)

    @matriz7[0,0] = Prtc09::Fraccion.new(-7, 2)
    @matriz7[0,1] = Prtc09::Fraccion.new(1, 1)
    @matriz7[1,0] = Prtc09::Fraccion.new(2, 3)
    @matriz7[1,1] = Prtc09::Fraccion.new(2, 1)
    assert_equal(@matriz7, @matriz3 - @matriz6)

  end


  def test_multiplicacion

    @matriz3[0,0] = 4
    @matriz3[0,1] = 0
    @matriz3[1,0] = 0
    @matriz3[1,1] = 0
    assert_equal(@matriz3, @matriz1 * @matriz2)

    @matriz6[0,0] = Prtc09::Fraccion.new(0, 1)
    @matriz6[0,1] = Prtc09::Fraccion.new(0, 1)
    @matriz6[1,0] = Prtc09::Fraccion.new(2, 3)
    @matriz6[1,1] = Prtc09::Fraccion.new(0, 1)
    assert_equal(@matriz6, @matriz4 * @matriz5)

    @matriz7[0,0] = Prtc09::Fraccion.new(0, 2)
    @matriz7[0,1] = Prtc09::Fraccion.new(0, 1)
    @matriz7[1,0] = Prtc09::Fraccion.new(1, 2)
    @matriz7[1,1] = Prtc09::Fraccion.new(0, 1)
    assert_equal(@matriz7, @matriz3 * @matriz6)

  end
  
end

