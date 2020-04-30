def xor?(arg1, arg2)
  if (arg1 || arg2) && !(arg1 && arg2)
    return true
  else
    return false
  end
end
