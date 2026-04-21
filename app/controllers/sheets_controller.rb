class SheetsController < ApplicationController
  def index
    @row_sheets = Sheet.order(:row, :column).group_by(&:row)
  end
end
