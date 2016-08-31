# morph
# Copyright (c) 2013 Charles Moncrief <cmoncrief@gmail.com>
# MIT Licensed

# Private function. Converts all object keys using the passed in function.
morphObj = (input, caller, cap) ->
  newObj = {}

  if Array.isArray(input)
    newArray = []
    for inputItem in input
      newValue = caller(inputItem, cap)
      newArray.push newValue

    return newArray

  for key, value of input
    newObj[caller(key, cap)] = value
    if typeof value == 'object'
      newValue = caller(value, cap)
    else
      newValue = value

    newObj[caller(key, cap)] = newValue;
  return newObj

# Private function. Capitalizes the first letter of the first word.
capFirst = (input) ->
  "#{input[0].toUpperCase()}#{input.slice 1}"

# Private function. Converts the first letter of the first word to lower case.
lowerFirst = (input) ->
  "#{input[0].toLowerCase()}#{input.slice 1}"

# Returns input string or object converted to snake case
# loremIpsumDolor => lorem_ipsum_dolor
toSnake = (input, cap) =>

  if typeof input is "object"
    return morphObj input, toSnake, cap

  output = input.replace /([A-Z\d])([A-Z][a-z\d])/g, '$1_$2'
  output = output.replace /([a-z\d])([A-Z])/g, '$1_$2'
  output = output.replace /[-. ]/g, '_'
  output = output.toLowerCase()
  output = capFirst output if cap
  return output

# Returns input string or object converted to caps snake case
# loremIpsumDolor => LOREM_IPSUM_DOLOR
toSnakeCaps = (input) =>

  if typeof input is "object"
    return morphObj input, toSnakeCaps

  output = @toSnake(input)
  output.toUpperCase()

# Return input string or object converted to hyphenated format.
# loremIpsumDolor => lorem-ipsum-dolor
toDashed = (input, cap) =>

  if typeof input is "object"
    return morphObj input, toDashed, cap

  output = input.replace /([A-Z\d])([A-Z][a-z\d])/g, '$1-$2'
  output = output.replace /([a-z\d])([A-Z])/g, '$1-$2'
  output = output.replace /[_. ]/g, '-'
  output = output.toLowerCase()
  output = capFirst output if cap
  return output

# Return input string or object converted to camel case.
# lorem_ipsum_dolor => loremIpsumDolor
toCamel = (input, cap) =>

  if typeof input is "object"
    return morphObj input, toCamel, cap

  unless input.match /[a-z]/ then input = input.toLowerCase()
  output = input.replace /([-_ .]+)([\w])/g, (str) -> str[1].toUpperCase()
  output = if cap then capFirst output else lowerFirst output

# Return input string or object convert to upper camel case.
# lorem_ipsum_dolor => LoremIpsumDolor
toUpperCamel = (input) ->
  
  toCamel input, true

# Return input string or object converted to human format.
# lorem_ipsum_dolor => Lorem ipsum dolor
toHuman = (input, cap = true) =>
  
  if typeof input is "object"
    return morphObj input, toHuman

  output = input.replace /[-._]/g, ' '
  output = output.replace /([A-Z\d])([A-Z][a-z\d])/g, '$1 $2'
  output = output.replace /([a-z])([A-Z])/g, '$1 $2'
  output = output.replace /(\s([a-zA-Z])\s)/g, (str, p1) -> "#{p1.toLowerCase()}"
  output = output.replace /([A-Z])([a-z])/g, (str, p1, p2) -> "#{p1.toLowerCase()}#{p2}"
  output = if cap then capFirst output else lowerFirst output
  return output

# Return input string or object converted to title format.
# lorem_ipsum_dolor => Lorem Ipsum Dolor
toTitle = (input) =>
  
  if typeof input is "object"
    return morphObj input, toTitle

  output = toHuman input
  output = output.replace /(\s)([a-z])/g, (str, p1, p2) -> "#{p1}#{p2.toUpperCase()}"
  return output

module.exports.toSnake      = toSnake
module.exports.toSnakeCaps  = toSnakeCaps
module.exports.toDashed     = toDashed
module.exports.toCamel      = toCamel
module.exports.toUpperCamel = toUpperCamel
module.exports.toHuman      = toHuman
module.exports.toTitle      = toTitle
