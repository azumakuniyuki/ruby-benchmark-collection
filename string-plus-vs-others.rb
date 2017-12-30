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
      stringP  = ''
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
B=./string-plus-vs-others.rb; ruby -v; ruby $B; echo; R=/usr/local/jr/bin/jruby; $R -v; $R $B
ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
ok
ok
ok
Rehearsal -------------------------------------------------
String#+        1.140000   0.010000   1.150000 (  1.179719)
String#<<       0.980000   0.010000   0.990000 (  0.989404)
String#concat   1.720000   0.010000   1.730000 (  1.731737)
---------------------------------------- total: 3.870000sec

                    user     system      total        real
String#+        1.110000   0.000000   1.110000 (  1.112322)
String#<<       0.910000   0.010000   0.920000 (  0.916289)
String#concat   1.720000   0.010000   1.730000 (  1.729537)
ruby $B  7.70s user 0.06s system 99% cpu 7.840 total

jruby 9.1.15.0 (2.3.3) 2017-12-07 929fde8 Java HotSpot(TM) 64-Bit Server VM 25.77-b03 on 1.8.0_77-b03 +jit [darwin-x86_64]
ok
ok
ok
Rehearsal -------------------------------------------------
String#+        1.530000   0.050000   1.580000 (  0.553956)
String#<<       0.740000   0.030000   0.770000 (  0.348538)
String#concat   0.610000   0.020000   0.630000 (  0.368605)
---------------------------------------- total: 2.980000sec

                    user     system      total        real
String#+        0.180000   0.000000   0.180000 (  0.174718)
String#<<       0.220000   0.030000   0.250000 (  0.207940)
String#concat   0.460000   0.010000   0.470000 (  0.342281)
$R $B  11.10s user 0.50s system 227% cpu 5.110 total

