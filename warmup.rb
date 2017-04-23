require 'pry'
#sets constants of regex searches
TYPE_REGEX = /^<(\w)+/
CLASS_REGEX = /class='([\w\s]*)'/
ID_REGEX = /id='([\w\s]*)/
NAME_REGEX = /name='([\w\s]*)/

#set up of Tag struct
Node = Struct.new(:type, :classes, :id, :name, :children, :parent)
#string to be parsed
html_string = "<div> class='foo bar' id='baz' name='fozzie'</div>"


def parse_tag(str)
  #finds <tags>
	type = str.match(TYPE_REGEX)
	#finds classes
	classes = str.match(CLASS_REGEX)
  #finds id
	id = str.match(ID_REGEX)
	#finds name
	name = str.match(NAME_REGEX)
	#call outputter method 
	outputter(type, classes, id, name)
	
end


def outputter(type, classes, id, name)
  # creates new node with parsed info
	attribute = Node.new(type, classes, id, name, [], nil)
	
	#iterated through struct and print data
	attribute.each do |att|
		puts att

		#binding-pry
	end
end

parse_tag(html_string)

