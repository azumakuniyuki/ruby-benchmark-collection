require 'benchmark'

HowMany = 40000000
Freeze  = { neko: 'Nyaan' }.freeze
Thawed  = { neko: 'Nyaan' }

puts 'ok' if Freeze[:neko] == 'Nyaan'
puts 'ok' if Thawed[:neko] == 'Nyaan'

Benchmark.bmbm do |b|
  v = 'Nyaan'
  b1 = 0
  b.report('Freeze') do
    HowMany.times do
      b1 += 1 if v == Freeze[:neko]
    end
  end

  b2 = 0
  b.report('Thawed') do
    HowMany.times do
      b2 += 1 if v == Thawed[:neko]
    end
  end
end

__END__
ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin13]
Rehearsal ------------------------------------------
Freeze   6.620000   0.050000   6.670000 (  6.691450)
Thawed   6.210000   0.050000   6.260000 (  6.261035)
-------------------------------- total: 12.930000sec

             user     system      total        real
Freeze   6.700000   0.050000   6.750000 (  6.881743)
Thawed   6.360000   0.050000   6.410000 (  6.420366)
ruby freeze-or-not-freeze.rb  25.95s user 0.22s system 99% cpu 26.396 total

