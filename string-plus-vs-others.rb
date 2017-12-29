require 'benchmark'

HowMany = 20000
String0 = 'shironekonyaaaaan'
String1 = 'sironeko'
String2 = 'nyaaaaan'

stringP = String1 + String2
stringA = String1 << String2
stringS = sprintf("%s%s", String1, String2)

puts 'ok' if stringP == String0
puts 'ok' if stringA == String0
puts 'ok' if stringS == String0

Benchmark.bmbm do |b|
  b.report('String#+') do
    HowMany.times do
      stringP = String1 + String2
    end
  end

  b.report('String#<<') do
    HowMany.times do
      stringA = String1 << String2
    end
  end

  b.report('sprintf()') do
    HowMany.times do
      stringS = sprintf("%s%s", String1, String2)
    end
  end
end

__END__
ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
Rehearsal ---------------------------------------------
String#+    0.060000   0.000000   0.060000 (  0.062340)
String#<<   0.030000   0.000000   0.030000 (  0.037969)
------------------------------------ total: 0.090000sec

                user     system      total        real
String#+   13.010000  17.950000  30.960000 ( 31.315896)
String#<<   0.020000   0.000000   0.020000 (  0.027570)
ruby string-plus-vs-others.rb  13.28s user 17.97s system 98% cpu 31.658 total

ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
Rehearsal ---------------------------------------------
String#+    0.020000   0.000000   0.020000 (  0.014798)
String#<<   0.010000   0.000000   0.010000 (  0.007509)
sprintf()   2.300000   1.260000   3.560000 (  3.573221)
------------------------------------ total: 3.590000sec

                user     system      total        real
String#+    0.880000   1.340000   2.220000 (  2.233472)
String#<<   0.000000   0.000000   0.000000 (  0.007416)
sprintf()   4.240000   2.180000   6.420000 (  6.466877)
ruby string-plus-vs-others.rb  7.61s user 4.82s system 99% cpu 12.503 total

