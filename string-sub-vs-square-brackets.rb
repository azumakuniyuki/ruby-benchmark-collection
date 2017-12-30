require 'benchmark'

HowMany = 600000
Nyaaaan = 'Siro::Neko::Nyaan'

v1 = Nyaaaan.dup; v1 = v1.sub('Siro::Neko::', ''); puts 'ok' if v1 == 'Nyaan'
v2 = Nyaaaan.dup; v2['Siro::Neko::'] = ''; puts 'ok' if v2 == 'Nyaan'
v3 = Nyaaaan.dup; v3 = v3.sub(/\ASiro::Neko::/, ''); puts 'ok' if v3 == 'Nyaan'
v4 = Nyaaaan.dup; v4[/\ASiro::Neko::/] = ''; puts 'ok' if v4 == 'Nyaan'

Benchmark.bmbm do |b|
  b.report('String#sub("...")') do
    HowMany.times do
      v = Nyaaaan.dup
      v = v.sub('Siro::Neko::', '')
    end
  end

  b.report('String#sub(%r//)') do
    HowMany.times do
      v = Nyaaaan.dup
      v = v.sub(/\ASiro::Neko::/, '')
    end
  end

  b.report('String#["..."]') do
    HowMany.times do
      v = Nyaaaan.dup
      v['Siro::Neko::'] = ''
    end
  end

  b.report('String#[%r//]') do
    HowMany.times do
      v = Nyaaaan.dup
      v[/Siro::Neko::/] = ''
    end
  end
end

__END__
ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
ok
ok
ok
ok
Rehearsal -----------------------------------------------------
String#sub("...")   2.790000   0.010000   2.800000 (  2.800069)
String#sub(%r//)    1.850000   0.000000   1.850000 (  1.865921)
String#["..."]      2.080000   0.010000   2.090000 (  2.084327)
String#[%r//]       1.530000   0.000000   1.530000 (  1.543904)
-------------------------------------------- total: 8.270000sec

                        user     system      total        real
String#sub("...")   2.790000   0.010000   2.800000 (  2.816879)
String#sub(%r//)    1.810000   0.010000   1.820000 (  1.821535)
String#["..."]      2.120000   0.010000   2.130000 (  2.137699)
String#[%r//]       1.540000   0.000000   1.540000 (  1.563804)
ruby $B  16.67s user 0.07s system 99% cpu 16.827 total

jruby 9.1.15.0 (2.3.3) 2017-12-07 929fde8 Java HotSpot(TM) 64-Bit Server VM 25.77-b03 on 1.8.0_77-b03 +jit [darwin-x86_64]
ok
ok
ok
ok
Rehearsal -----------------------------------------------------
String#sub("...")   2.960000   0.070000   3.030000 (  1.266947)
String#sub(%r//)    0.800000   0.020000   0.820000 (  0.510166)
String#["..."]      0.980000   0.020000   1.000000 (  0.357527)
String#[%r//]       0.630000   0.020000   0.650000 (  0.364210)
-------------------------------------------- total: 5.500000sec

                        user     system      total        real
String#sub("...")   0.600000   0.020000   0.620000 (  0.587058)
String#sub(%r//)    0.370000   0.020000   0.390000 (  0.394740)
String#["..."]      0.130000   0.000000   0.130000 (  0.120137)
String#[%r//]       0.280000   0.010000   0.290000 (  0.295644)

