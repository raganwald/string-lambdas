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

  describe "comparators", ->
    it "should return a predicate", ->
      lt100 = functionalize('<100')
      gt100 = functionalize('>100')
      ltEq100 = functionalize('<=100')
      gtEq100 = functionalize('>=100')

      expect( lt100(50) ).toBe true
      expect( gt100(150) ).toBe true
      expect( lt100(150) ).toBe false
      expect( gt100(50) ).toBe false

      expect( ltEq100(50) ).toBe true
      expect( ltEq100(100) ).toBe true
      expect( gtEq100(150) ).toBe true
      expect( gtEq100(100) ).toBe true

  describe "equivalence and equality", ->
    it "should return a predicate", ->
      eq100 = functionalize('==100')
      is100 = functionalize('===100')

      expect( eq100(100)).toBe true
      expect( eq100('100')).toBe true
      expect( eq100(0)).toBe false

      expect( is100(100)).toBe true
      expect( is100('100')).toBe false
      expect( is100(0)).toBe false

describe "string lambdas with an implicit arg on the right", ->
  describe "arithmetical forms", ->
    it "should return a function", ->
      twoPlus  = functionalize('2+')
      tenOver  = functionalize('10/')
      twoTimes = functionalize('2*')
      twoMinus = functionalize('2-')

      expect( twoPlus(10) ).toEqual 12
      expect( tenOver(2) ).toEqual 5
      expect( twoTimes(10) ).toEqual 20
      expect( twoMinus(10) ).toEqual -8

  describe "comparators", ->
    it "should return a predicate", ->
      lt100 = functionalize('100>')
      gt100 = functionalize('100<')
      ltEq100 = functionalize('100>=')
      gtEq100 = functionalize('100<=')

      expect( lt100(50) ).toBe true
      expect( gt100(150) ).toBe true
      expect( lt100(150) ).toBe false
      expect( gt100(50) ).toBe false

      expect( ltEq100(50) ).toBe true
      expect( ltEq100(100) ).toBe true
      expect( gtEq100(150) ).toBe true
      expect( gtEq100(100) ).toBe true

  describe "equivalence and equality", ->
    it "should return a predicate", ->
      eq100 = functionalize('100==')
      is100 = functionalize('100===')

      expect( eq100(100)).toBe true
      expect( eq100('100')).toBe true
      expect( eq100(0)).toBe false

      expect( is100(100)).toBe true
      expect( is100('100')).toBe false
      expect( is100(0)).toBe false

describe "string lambdas with an implicit args on both sides", ->
  describe "arithmetical forms", ->
    it "should return a function", ->
      plus = functionalize('+')
      times = functionalize('*')
      div = functionalize('/')

      expect( plus(10, 2) ).toEqual 12
      expect( times(10, 2) ).toEqual 20
      expect( div(10, 2) ).toEqual 5

    it "should return a negation function", ->
      minus = functionalize('-')
      expect( minus(10) ).toEqual -10

  describe "comparators", ->
    it "should return a predicate", ->
      lt = functionalize('<')
      gt = functionalize('>')
      ltEq = functionalize('<=')
      gtEq = functionalize('>=')

      expect( lt(50, 100) ).toBe true
      expect( gt(150, 100) ).toBe true
      expect( ltEq(50, 100) ).toBe true
      expect( ltEq(100, 100) ).toBe true
      expect( gtEq(150, 100) ).toBe true
      expect( gtEq(100, 100) ).toBe true
