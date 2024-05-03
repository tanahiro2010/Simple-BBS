# frozen_string_literal: true

class Object
  def seve path
    File.open(path=path, mode="w") do |file|
      file.write JSON.generate self
    end
  end

  def create name
    self[name] = {
      "comments" => []
    }

    self.seve "./DB/Sleds.json"
  end
end
