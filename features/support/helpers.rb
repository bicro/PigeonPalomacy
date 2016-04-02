class String
  def to_bool
    !!(self =~ /^yes|y|true|t|1$/i)
  end
end