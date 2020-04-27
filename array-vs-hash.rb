require 'benchmark'

HowMany = 5000000
Neko1 = ['neko', 'nyaan', 'cat']
Neko2 = {'x' => 'neko', 'y' => 'nyaan', 'z' => 'cat'}

puts 'ok' if Neko1[0]   == 'neko'
puts 'ok' if Neko2['x'] == 'neko'

Benchmark.bmbm do |b|
  b.report('Array#[]') do
    HowMany.times do
      v = Neko1[0] + Neko1[1] + Neko1[2]
    end
  end

  b.report('Hash#[]') do
    HowMany.times do
      v = Neko2['x'] + Neko2['y'] + Neko2['z']
    end
  end
end

__END__

