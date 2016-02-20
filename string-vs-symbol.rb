require 'benchmark'

HowMany = 30000000
String0 = 'sironeko'
Symbol0 = :sironeko

puts 'ok' if String0 == 'sironeko'
puts 'ok' if Symbol0 == :sironeko

Benchmark.bmbm do |b|
  b1 = 0
  b.report('String') do
    HowMany.times do
      b1 += 1 if String0 == 'sironeko'
    end
  end

  b2 = 0
  b.report('Symbol') do
    HowMany.times do
      b2 += 1 if Symbol0 == :sironeko
    end
  end
end

__END__
ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin13]
Rehearsal ------------------------------------------
String   6.540000   0.070000   6.610000 (  6.619563)
Symbol   3.170000   0.050000   3.220000 (  3.255752)
--------------------------------- total: 9.830000sec

             user     system      total        real
String   6.470000   0.060000   6.530000 (  6.535174)
Symbol   3.080000   0.020000   3.100000 (  3.105818)
ruby string-vs-symbol.rb  19.31s user 0.21s system 99% cpu 19.593 total

