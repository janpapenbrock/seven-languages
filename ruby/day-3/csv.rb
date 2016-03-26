module ActsAsCsv

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end

    def rows
      @rows = @rows || @csv_contents.collect do |row|
        CsvRow.new(row, @headers)
      end
    end

    def each &block
      rows.each &block
    end
  end
end

class CsvRow
  def initialize values, keys
    @lookup = Hash[keys.zip(values)]
  end

  def method_missing name
    puts @lookup[name.to_s]
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each {|row| puts row.one}
m.each {|row| puts row.two}
