defmodule Kata04 do

def convert_to_matrix(file_path) do

  contents = File.read!(file_path)

  rows= String.split(contents,"\n")

  columns= rows |> Enum.map(fn row ->
    String.split(row,",")
  end)


end



end
