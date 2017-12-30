require 'benchmark'

HowMany = 1200000
Nyaaaan = [0,1,2,3,4,5,6,7,8,9]

puts 'ok' if Nyaaaan[0]  == 0
puts 'ok' if Nyaaaan[-1] == 9
puts 'ok' if Nyaaaan.first == 0
puts 'ok' if Nyaaaan.last  == 0

Benchmark.bmbm do |b|
  b.report('Array#[0]') do
    v = 0
    HowMany.times do
      v += 1 if Nyaaaan[0] == 0
    end
  end

  b.report('Array#first') do
    v = 0
    HowMany.times do
      v += 1 if Nyaaaan.first == 0
    end
  end

  b.report('Array#[-1]') do
    v = 0
    HowMany.times do
      v += 1 if Nyaaaan[-1] == 9
    end
  end

  b.report('Array#last') do
    v = 0
    HowMany.times do
      v += 1 if Nyaaaan.last == 9
    end
  end

end

__END__
ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
ok
ok
ok
Rehearsal -----------------------------------------------
Array#[0]     0.420000   0.000000   0.420000 (  0.414402)
Array#first   0.480000   0.000000   0.480000 (  0.494244)
Array#[-1]    0.430000   0.010000   0.440000 (  0.435105)
Array#last    0.590000   0.000000   0.590000 (  0.764984)
-------------------------------------- total: 1.930000sec

                  user     system      total        real
Array#[0]     0.450000   0.010000   0.460000 (  0.539475)
Array#first   0.550000   0.010000   0.560000 (  0.572031)
Array#[-1]    0.490000   0.000000   0.490000 (  0.503659)
Array#last    0.560000   0.010000   0.570000 (  0.593126)
ruby $B  4.13s user 0.05s system 92% cpu 4.503 total

jruby 9.1.15.0 (2.3.3) 2017-12-07 929fde8 Java HotSpot(TM) 64-Bit Server VM 25.77-b03 on 1.8.0_77-b03 +jit [darwin-x86_64]
ok
ok
ok
Rehearsal -----------------------------------------------
Array#[0]     1.060000   0.020000   1.080000 (  0.390926)
Array#first   0.510000   0.010000   0.520000 (  0.210294)
Array#[-1]    0.530000   0.020000   0.550000 (  0.243771)
Array#last    0.300000   0.000000   0.300000 (  0.154797)
-------------------------------------- total: 2.450000sec

                  user     system      total        real
Array#[0]     0.100000   0.020000   0.120000 (  0.083157)
Array#first   0.100000   0.000000   0.100000 (  0.086861)
Array#[-1]    0.070000   0.000000   0.070000 (  0.071112)
Array#last    0.080000   0.020000   0.100000 (  0.089452)

