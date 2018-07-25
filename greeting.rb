def greet_name
  k = 0
  ARGV.each do
    while k < ARGV.length-1
      puts ARGV[0] + " " + ARGV[k+1]
      k+=1
    end
  end
end

greet_name
