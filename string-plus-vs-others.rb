require 'benchmark'

HowMany = 1000000
string0 = 'nekonyaan'
string1 = 'nyaan'

stringP = 'neko'; stringP += string1
stringA = 'neko'; stringA << string1
stringC = 'neko'; stringC.concat(string1)

puts 'ok' if stringP == string0
puts 'ok' if stringA == string0
puts 'ok' if stringC == string0

Benchmark.bmbm do |b|
  b.report('String#+') do
    HowMany.times do
      stringP  = ''
      stringP += 'neko'
      stringP += string1
    end
  end

  b.report('String#<<') do
    HowMany.times do
      stringA  = ''
      stringA << 'neko'
      stringA << string1
    end
  end

  b.report('String#concat') do
    HowMany.times do
      stringC = ''
      stringC.concat('neko')
      stringC.concat(string1)
    end
  end
end

__END__
ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
Rehearsal -------------------------------------------------
String#+        1.130000   0.000000   1.130000 (  1.142643)
String#<<       0.920000   0.000000   0.920000 (  0.928554)
String#concat   1.680000   0.010000   1.690000 (  1.686617)
---------------------------------------- total: 3.740000sec

                    user     system      total        real
String#+        1.100000   0.000000   1.100000 (  1.103764)
String#<<       0.890000   0.000000   0.890000 (  0.898239)
String#concat   1.650000   0.000000   1.650000 (  1.652806)

jruby 9.1.15.0 (2.3.3) 2017-12-07 929fde8 Java HotSpot(TM) 64-Bit Server VM 25.77-b03 on 1.8.0_77-b03 +jit [darwin-x86_64]
ok
ok
ok
Rehearsal -------------------------------------------------
String#+        1.920000   0.060000   1.980000 (  0.666109)
String#<<       0.760000   0.020000   0.780000 (  0.397076)
String#concat   0.590000   0.030000   0.620000 (  0.360320)
---------------------------------------- total: 3.380000sec

                    user     system      total        real
String#+        0.220000   0.000000   0.220000 (  0.214419)
String#<<       0.260000   0.020000   0.280000 (  0.272481)
String#concat   0.280000   0.000000   0.280000 (  0.271635)

