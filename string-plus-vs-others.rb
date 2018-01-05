require 'benchmark'

HowMany = 2000000
string0 = 'nekonyaan'
string1 = 'nyaan'

stringP = 'neko'; stringP += string1
stringA = 'neko'; stringA << string1
stringC = 'neko'; stringC.concat(string1)
stringS = 'neko'; stringS = sprintf("%s%s", stringS, string1)

puts 'ok' if stringP == string0
puts 'ok' if stringA == string0
puts 'ok' if stringC == string0
puts 'ok' if stringS == string0

Benchmark.bmbm do |b|
  b.report('String#+') do
    HowMany.times do
      stringP  = ''
      stringP += 'neko' + string1
    end
  end

  b.report('String#<<') do
    HowMany.times do
      stringA  = ''
      stringA << 'neko' << string1
    end
  end

  b.report('String#concat') do
    HowMany.times do
      stringC = ''
      stringC.concat('neko' + string1)
    end
  end

  b.report('String#sprintf') do
    HowMany.times do
      stringS = ''
      stringS = sprintf("neko%s", string1)
    end
  end
end

__END__
ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
Rehearsal --------------------------------------------------
String#+         2.130000   0.000000   2.130000 (  2.143257)
String#<<        1.740000   0.010000   1.750000 (  1.750788)
String#concat    2.710000   0.000000   2.710000 (  2.722870)
String#sprintf   3.450000   0.010000   3.460000 (  3.461874)
---------------------------------------- total: 10.050000sec

                     user     system      total        real
String#+         2.120000   0.010000   2.130000 (  2.139258)
String#<<        1.750000   0.000000   1.750000 (  1.763009)
String#concat    2.670000   0.010000   2.680000 (  2.690509)
String#sprintf   3.390000   0.010000   3.400000 (  3.412469)

jruby 9.1.15.0 (2.3.3) 2017-12-07 929fde8 Java HotSpot(TM) 64-Bit Server VM 25.77-b03 on 1.8.0_77-b03 +jit [darwin-x86_64]
Rehearsal --------------------------------------------------
String#+         1.910000   0.060000   1.970000 (  0.820285)
String#<<        1.070000   0.040000   1.110000 (  0.681074)
String#concat    0.750000   0.010000   0.760000 (  0.527113)
String#sprintf   2.120000   0.060000   2.180000 (  1.027155)
----------------------------------------- total: 6.020000sec

                     user     system      total        real
String#+         0.390000   0.010000   0.400000 (  0.380950)
String#<<        0.560000   0.010000   0.570000 (  0.496603)
String#concat    0.450000   0.000000   0.450000 (  0.446095)
String#sprintf   1.370000   0.020000   1.390000 (  0.803323)

