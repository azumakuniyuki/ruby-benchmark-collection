require 'benchmark'

HowMany = 1600000
Nyaaaan = 'NekoNyaan'

puts 'ok' if Nyaaaan.start_with?('Neko')
puts 'ok' if Nyaaaan.end_with?('Nyaan')
puts 'ok' if Nyaaaan.start_with?('NekoNyaan')
puts 'ok' if Nyaaaan.end_with?('NekoNyaan')
puts 'ok' if Nyaaaan =~ /\ANeko/
puts 'ok' if Nyaaaan =~ /Nyaan\z/
puts 'ok' if Nyaaaan =~ /\ANekoNyaan\z/

Benchmark.bmbm do |b|
  b.report('String#start_with') do
    HowMany.times do
      Nyaaaan.start_with?('Neko')
    end
  end

  b.report('String#start_with(all)') do
    HowMany.times do
      Nyaaaan.start_with?('NekoNyaan')
    end
  end

  b.report('String#end_with(all)') do
    HowMany.times do
      Nyaaaan.end_with?('Nyaan')
    end
  end

  b.report('String#end_with') do
    HowMany.times do
      Nyaaaan.end_with?('NekoNyaan')
    end
  end

  b.report('String =~ /\A.../') do
    HowMany.times do
      Nyaaaan =~ /\ANeko/
    end
  end

  b.report('String =~ /...\z/') do
    HowMany.times do
      Nyaaaan =~ /Nyaan\z/
    end
  end

  b.report('String =~ /\A...\z/') do
    HowMany.times do
      Nyaaaan =~ /\ANekoNyaan\z/
    end
  end

end

__END__


