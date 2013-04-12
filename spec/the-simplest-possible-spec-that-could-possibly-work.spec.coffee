{functionalize} = require '../lib/string-lambdas'

describe "runs a string lambda", ->
  
  it "should functionalize a string", ->
    expect( functionalize('+ 1')(1) ).toEqual 2