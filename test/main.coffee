assert = require 'assert'
morph  = require '../lib/morph'

describe 'Snake case', ->

  it 'should convert camel case to snake case', ->
    output = morph.toSnake "loremIpsumDolor"
    assert.equal output, "lorem_ipsum_dolor"

  it 'should convert camel case with abbreviations to snake case', ->
    output = morph.toSnake "NASAAndTheJPL"
    assert.equal output, "nasa_and_the_jpl"

  it 'should convert human text to snake case', ->
    output = morph.toSnake "Lorem ipsum dolor"
    assert.equal output, "lorem_ipsum_dolor"

  it 'should convert hypenated text to snake case', ->
    output = morph.toSnake "lorem-ipsum-dolor"
    assert.equal output, "lorem_ipsum_dolor"

  it 'should convert dotted text to snake case', ->
    output = morph.toSnake "lorem.ipsum.dolor"
    assert.equal output, "lorem_ipsum_dolor"

  it 'should uppercase the first character when specified', ->
    output = morph.toSnake "loremIpsumDolor", true
    assert.equal output, "Lorem_ipsum_dolor"

  it 'should not change snake case', ->
    output = morph.toSnake "lorem_ipsum_dolor"
    assert.equal output, "lorem_ipsum_dolor"

  it 'should convert mixed text to snake case', ->
    output = morph.toSnake "LOREM.ipsum-DolorSit_amet"
    assert.equal output, "lorem_ipsum_dolor_sit_amet"

describe 'Snake caps', ->

  it 'should convert camel case to snake caps', ->
    output = morph.toSnakeCaps "loremIpsumDolor"
    assert.equal output, "LOREM_IPSUM_DOLOR"

  it 'should convert camel case with abbreviations to snake caps', ->
    output = morph.toSnakeCaps "NASAAndTheJPL"
    assert.equal output, "NASA_AND_THE_JPL"

  it 'should convert human text to snake caps', ->
    output = morph.toSnakeCaps "Lorem ipsum dolor"
    assert.equal output, "LOREM_IPSUM_DOLOR"

  it 'should convert hypenated text to snake caps', ->
    output = morph.toSnakeCaps "lorem-ipsum-dolor"
    assert.equal output, "LOREM_IPSUM_DOLOR"

  it 'should convert dotted text to snake caps', ->
    output = morph.toSnakeCaps "lorem.ipsum.dolor"
    assert.equal output, "LOREM_IPSUM_DOLOR"

  it 'should not change snake caps', ->
    output = morph.toSnakeCaps "lorem_ipsum_dolor"
    assert.equal output, "LOREM_IPSUM_DOLOR"

  it 'should convert mixed text to snake caps', ->
    output = morph.toSnakeCaps "LOREM.ipsum-DolorSit_amet"
    assert.equal output, "LOREM_IPSUM_DOLOR_SIT_AMET"

describe 'Dashed', ->

  it 'should convert camel case to dashed', ->
    output = morph.toDashed "loremIpsumDolor"
    assert.equal output, "lorem-ipsum-dolor"

  it 'should convert camel case with abbreviations to dashed', ->
    output = morph.toDashed "NASAAndTheJPL"
    assert.equal output, "nasa-and-the-jpl"

  it 'should convert human text to dashed', ->
    output = morph.toDashed "Lorem ipsum dolor"
    assert.equal output, "lorem-ipsum-dolor"

  it 'should convert snake case to dashed', ->
    output = morph.toDashed "lorem_ipsum_dolor"
    assert.equal output, "lorem-ipsum-dolor"

  it 'should convert dotted text to dashed', ->
    output = morph.toDashed "lorem.ipsum.dolor"
    assert.equal output, "lorem-ipsum-dolor"

  it 'should uppercase the first character when specified', ->
    output = morph.toDashed "loremIpsumDolor", true
    assert.equal output, "Lorem-ipsum-dolor"

  it 'should convert mixed text to dashed', ->
    output = morph.toDashed "LOREM.ipsum-DolorSit_amet"
    assert.equal output, "lorem-ipsum-dolor-sit-amet"

  it 'should not change dashed', ->
    output = morph.toDashed "lorem_ipsum_dolor"
    assert.equal output, "lorem-ipsum-dolor"
    
describe 'Camel case', ->

  it 'should convert snake case to camel case', ->
    output = morph.toCamel "lorem_ipsum_dolor"
    assert.equal output, "loremIpsumDolor"

  it 'should convert spaced text to camel case', ->
    output = morph.toCamel "Lorem ipsum dolor"
    assert.equal output, "loremIpsumDolor"

  it 'should convert dotted text to camel case', ->
    output = morph.toCamel "lorem.ipsum.dolor"
    assert.equal output, "loremIpsumDolor"

  it 'should convert hyphenated text to camel case', ->
    output = morph.toCamel "lorem-ipsum-dolor"
    assert.equal output, "loremIpsumDolor"

  it 'should uppercase the first character when specified', ->
    output = morph.toCamel "lorem_Ipsum.dolor", true
    assert.equal output, "LoremIpsumDolor"

  it 'should convert mixed text to camel case', ->
    output = morph.toCamel "Lorem.ipsum-DolorSit_amet"
    assert.equal output, "loremIpsumDolorSitAmet"

  it 'should convert snake caps to camel case', ->
    output = morph.toCamel "LOREM_IPSUM_DOLOR"
    assert.equal output, "loremIpsumDolor"

  it 'should not change camel case', ->
    output = morph.toCamel "loremIpsumDolor"
    assert.equal output, "loremIpsumDolor"

describe 'Upper camel case', ->

  it 'should convert snake case to upper camel case', ->
    output = morph.toUpperCamel "lorem_ipsum_dolor"
    assert.equal output, "LoremIpsumDolor"

  it 'should convert spaced text to upper camel case', ->
    output = morph.toUpperCamel "Lorem ipsum dolor"
    assert.equal output, "LoremIpsumDolor"

  it 'should convert dotted text to upper camel case', ->
    output = morph.toUpperCamel "lorem.ipsum.dolor"
    assert.equal output, "LoremIpsumDolor"

  it 'should convert hyphenated text to upper camel case', ->
    output = morph.toUpperCamel "lorem-ipsum-dolor"
    assert.equal output, "LoremIpsumDolor"

  it 'should convert mixed text to upper camel case', ->
    output = morph.toUpperCamel "Lorem.ipsum-DolorSit_amet"
    assert.equal output, "LoremIpsumDolorSitAmet"

  it 'should convert snake caps to upper camel case', ->
    output = morph.toUpperCamel "LOREM_IPSUM_DOLOR"
    assert.equal output, "LoremIpsumDolor"

  it 'should not change upper camel case', ->
    output = morph.toUpperCamel "loremIpsumDolor"
    assert.equal output, "LoremIpsumDolor"

describe 'Human', ->

  it 'should convert snake case to human format', ->
    output = morph.toHuman 'lorem_ipsum_dolor'
    assert.equal output, 'Lorem ipsum dolor'

  it 'should convert camel case to human format', ->
    output = morph.toHuman 'loremIpsumDolor'
    assert.equal output, 'Lorem ipsum dolor'

  it 'should convert camel case with abbreviations to human format', ->
    output = morph.toHuman "NASAAndTheJPLHaveARocket"
    assert.equal output, "NASA and the JPL have a rocket"

  it 'should convert hyphenated text to human format', ->
    output = morph.toHuman 'lorem-Ipsum-dolor'
    assert.equal output, 'Lorem ipsum dolor'

  it 'should convert dotted text to human format', ->
    output = morph.toHuman 'lorem-Ipsum-dolor'
    assert.equal output, 'Lorem ipsum dolor'

  it 'should convert mixed text to human format', ->
    output = morph.toHuman "Lorem.ipsum-DolorSit_amet"
    assert.equal output, "Lorem ipsum dolor sit amet"

  it 'should separate single letter words', ->
    output = morph.toHuman "thisIsACamelCaseWord"
    assert.equal output, "This is a camel case word"

  it 'should not change human formatted text', ->
    output = morph.toHuman 'Lorem ipsum dolor'
    assert.equal output, 'Lorem ipsum dolor'

describe 'Title', ->

  it 'should convert snake case to title format', ->
    output = morph.toTitle 'lorem_ipsum_dolor'
    assert.equal output, 'Lorem Ipsum Dolor'

  it 'should convert camel case to title format', ->
    output = morph.toTitle 'loremIpsumDolor'
    assert.equal output, 'Lorem Ipsum Dolor'

  it 'should convert camel case with abbreviations to title format', ->
    output = morph.toTitle "NASAAndTheJPLHaveARocket"
    assert.equal output, "NASA And The JPL Have A Rocket"

  it 'should convert hyphenated text to title format', ->
    output = morph.toTitle 'lorem-Ipsum-dolor'
    assert.equal output, 'Lorem Ipsum Dolor'

  it 'should convert dotted text to title format', ->
    output = morph.toTitle 'lorem-Ipsum-dolor'
    assert.equal output, 'Lorem Ipsum Dolor'

  it 'should convert mixed text to title format', ->
    output = morph.toTitle "Lorem.ipsum-DolorSit_amet"
    assert.equal output, "Lorem Ipsum Dolor Sit Amet"

  it 'should separate single letter words', ->
    output = morph.toTitle "thisIsACamelCaseWord"
    assert.equal output, "This Is A Camel Case Word"

  it 'should not change title format', ->
    output = morph.toTitle 'Lorem Ipsum Dolor'
    assert.equal output, 'Lorem Ipsum Dolor'

describe 'Object keys', ->

  it 'should convert all keys to snake case', ->
    tmp = morph.toSnake {loremIpsumDolor: "test", "Sit-Amet": "test"}
    assert tmp.lorem_ipsum_dolor
    assert tmp.sit_amet

  it 'should convert all keys to snake caps', ->
    tmp = morph.toSnakeCaps {loremIpsumDolor: "test", "Sit-Amet": "test"}
    assert tmp.LOREM_IPSUM_DOLOR
    assert tmp.SIT_AMET

  it 'should convert all keys to camel case', ->
    tmp = morph.toCamel {lorem_ipsum_dolor: "test", "Sit-Amet": "test"}
    assert tmp.loremIpsumDolor
    assert tmp.sitAmet

  it 'should convert all keys to dashed', ->
    tmp = morph.toDashed {loremIpsumDolor: "test", "Sit_Amet": "test"}
    assert tmp["lorem-ipsum-dolor"]
    assert tmp["sit-amet"]

  it 'should convert all keys to human', ->
    tmp = morph.toHuman {loremIpsumDolor: "test", "Sit_Amet": "test"}
    assert tmp["Lorem ipsum dolor"]
    assert tmp["Sit amet"]

  it 'should convert all keys to titles', ->
    tmp = morph.toTitle {loremIpsumDolor: "test", "Sit_Amet": "test"}
    assert tmp["Lorem Ipsum Dolor"]
    assert tmp["Sit Amet"]

