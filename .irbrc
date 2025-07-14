def clip(value)
  IO.popen('pbcopy', 'w') { |f| f << value.to_s }
  value
end
