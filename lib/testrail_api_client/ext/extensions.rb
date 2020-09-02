class Array
    def to_list
      join(',')
    end
end

class NilClass
    def to_list
        ''
    end
end

class String
    def to_list
        self
    end
end