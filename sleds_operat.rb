# frozen_string_literal: true

class Sleds_operat
  def initialize
    require 'json'
    super
  end

  def seve path, data
    File.open(path=path, mode="w") do |file|
      file.write(JSON.generate data)
    end
    puts "Done seve"
    true
  end

  def create_sled name

  end
end
