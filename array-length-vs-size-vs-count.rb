require 'benchmark'

HowMany = 6000000
Nyaaaan = [1,2,3]

puts 'ok' if Nyaaaan.size == 3
puts 'ok' if Nyaaaan.count == 3
puts 'ok' if Nyaaaan.length == 3

Benchmark.bmbm do |b|
  as = 0
  b.report('Array#size') do
    HowMany.times do
      as += Nyaaaan.size
    end
  end

  b.report('Array#count') do
    ac = 0
    HowMany.times do
      ac += Nyaaaan.count
    end
  end

  b.report('Array#length') do
    al = 0
    HowMany.times do
      al += Nyaaaan.length
    end
  end
end

__END__

ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
ok
ok
ok
Rehearsal ------------------------------------------------
Array#size     1.870000   0.030000   1.900000 (  2.267940)
Array#count    2.380000   0.050000   2.430000 (  2.747802)
Array#length   1.810000   0.040000   1.850000 (  2.042375)
--------------------------------------- total: 6.180000sec

                   user     system      total        real
Array#size     1.830000   0.040000   1.870000 (  2.087291)
Array#count    2.390000   0.030000   2.420000 (  2.508655)
Array#length   1.870000   0.030000   1.900000 (  2.099171)
ruby ./array-length-vs-size-vs-count.rb  12.30s user 0.24s system 89% cpu 13.932 total

jruby 9.1.15.0 (2.3.3) 2017-12-07 929fde8 Java HotSpot(TM) 64-Bit Server VM 25.77-b03 on 1.8.0_77-b03 +jit [darwin-x86_64]
ok
ok
ok
Rehearsal ------------------------------------------------
Array#size     1.550000   0.050000   1.600000 (  0.907780)
Array#count    0.780000   0.040000   0.820000 (  0.654255)
Array#length   0.880000   0.040000   0.920000 (  0.694111)
--------------------------------------- total: 3.340000sec

                   user     system      total        real
Array#size     0.370000   0.000000   0.370000 (  0.402080)
Array#count    0.380000   0.030000   0.410000 (  0.430997)
Array#length   0.360000   0.000000   0.360000 (  0.372495)
$R ./array-length-vs-size-vs-count.rb  13.50s user 0.90s system 141% cpu 10.150 total
