class Matrix
  def initialize(raw_matrix)
    self.rows = raw_matrix
    self.columns = raw_matrix
  end

  def rows=(matrix)
    @rows = matrix.lines.map do |row| 
      string_row = row.chomp.split(" ") 
      string_row.map { |value| value.to_i }
    end
  end

  def columns=(matrix)
    converted_matrix = @rows
    col_num = 0
    columns = Array.new
    until columns.size == converted_matrix[0].size
      column = Array.new
      for i in 0...converted_matrix.size
        column.push(converted_matrix[i][col_num])
      end
      columns.push(column)
      col_num += 1
    end
    @columns = columns
  end

  def row(row_number)
    @rows[row_number - 1]
  end

  def column(column_number)
    @columns[column_number - 1]
  end
end
