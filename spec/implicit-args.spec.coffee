{functionalize} = require '../lib/string-lambdas'

describe "string lambdas with an implicit arg on the left", ->
  describe "arithmetical forms", ->
    it "should return a function", ->
      plus2  = functionalize('+2')
      divBy2 = functionalize('/2')
      times2 = functionalize('*2')

      expect( plus2(10) ).toEqual 12
      expect( divBy2(10) ).toEqual 5
      expect( times2(10) ).toEqual 20

    it "does not allow minus (BUG)", ->
      minus2 = functionalize('-2')

      expect( minus2(10) ).toEqual -2

describe "string lambdas with an implicit arg on the right", ->
  describe "arithmetical forms", ->
    it "should return a function", ->
      twoPlus  = functionalize('2+')
      tenOver  = functionalize('10/')
      twoTimes = functionalize('2*')

      expect( twoPlus(10) ).toEqual 12
      expect( tenOver(2) ).toEqual 5
      expect( twoTimes(10) ).toEqual 20

    it "should allow minus", ->
      twoMinus = functionalize('2-')

      expect( twoMinus(10) ).toEqual -8
