defmodule Kata04 do

def convert_to_matrix(file_path) do

  contents = File.read!(file_path)

  rows= String.split(contents,"\n")

  columns= rows |> Enum.map(fn row ->
    String.split(row,",")
  end)

  access_columns(columns,[0,1,2])

end

def access_columns(columns, indexes)do
filtered_columns = Enum.map(columns, fn row ->
  Enum.map(indexes, &Enum.at(row, &1))
end)

get_difference(filtered_columns)
end


def get_difference(columns) do
  target_columns = Enum.map(columns, fn [col1, col2, col3] ->
    {col1, String.to_integer(col2) - String.to_integer(col3)}
  end)

  IO.inspect(target_columns)
end

end
