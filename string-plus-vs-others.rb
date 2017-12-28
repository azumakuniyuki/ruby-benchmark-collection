require 'benchmark'

HowMany = 80000
String0 = 'shironekonyaaaaan'
String1 = 'sironeko'
String2 = 'nyaaaaan'

stringP = String1 + String2
stringA = String1 << String2

puts 'ok' if stringP == String0
puts 'ok' if stringA == String0

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
String#+    0.110000   0.000000   0.110000 (  0.112906)
String#<<   0.050000   0.000000   0.050000 (  0.055197)
------------------------------------ total: 0.160000sec

                user     system      total        real
String#+   13.730000  19.020000  32.750000 ( 33.718283)
String#<<   0.040000   0.000000   0.040000 (  0.036711)
ruby string-plus-vs-others.rb  14.12s user 19.04s system 97% cpu 34.162 total
