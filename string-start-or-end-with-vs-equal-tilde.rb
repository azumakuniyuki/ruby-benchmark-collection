require 'benchmark'

HowMany = 1600000
Nyaaaan = 'NekoNyaan'

puts 'ok' if Nyaaaan.start_with?('Neko')
puts 'ok' if Nyaaaan.end_with?('Nyaan')
puts 'ok' if Nyaaaan.start_with?('NekoNyaan')
puts 'ok' if Nyaaaan.end_with?('NekoNyaan')
puts 'ok' if Nyaaaan =~ /\ANeko/
puts 'ok' if Nyaaaan =~ /Nyaan\z/
puts 'ok' if Nyaaaan =~ /\ANekoNyaan\z/

Benchmark.bmbm do |b|
  b.report('String#start_with') do
    HowMany.times do
      Nyaaaan.start_with?('Neko')
    end
  end

  b.report('String#start_with(all)') do
    HowMany.times do
      Nyaaaan.start_with?('NekoNyaan')
    end
  end

  b.report('String#end_with(all)') do
    HowMany.times do
      Nyaaaan.end_with?('Nyaan')
    end
  end

  b.report('String#end_with') do
    HowMany.times do
      Nyaaaan.end_with?('NekoNyaan')
    end
  end

  b.report('String =~ /\A.../') do
    HowMany.times do
      Nyaaaan =~ /\ANeko/
    end
  end

  b.report('String =~ /...\z/') do
    HowMany.times do
      Nyaaaan =~ /Nyaan\z/
    end
  end

  b.report('String =~ /\A...\z/') do
    HowMany.times do
      Nyaaaan =~ /\ANekoNyaan\z/
    end
  end

end

__END__

ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
Rehearsal ----------------------------------------------------------
String#start_with        0.790000   0.000000   0.790000 (  0.803203)
String#start_with(all)   0.780000   0.000000   0.780000 (  0.780285)
String#end_with(all)     0.790000   0.000000   0.790000 (  0.801215)
String#end_with          0.800000   0.010000   0.810000 (  0.800526)
String =~ /\A.../        1.550000   0.000000   1.550000 (  1.561355)
String =~ /...\z/        1.610000   0.010000   1.620000 (  1.621699)
String =~ /\A...\z/      1.640000   0.000000   1.640000 (  1.649723)
------------------------------------------------- total: 7.980000sec

                             user     system      total        real
String#start_with        0.740000   0.000000   0.740000 (  0.752940)
String#start_with(all)   0.830000   0.010000   0.840000 (  0.838893)
String#end_with(all)     0.830000   0.000000   0.830000 (  0.844759)
String#end_with          0.840000   0.000000   0.840000 (  0.845806)
String =~ /\A.../        1.520000   0.010000   1.530000 (  1.524290)
String =~ /...\z/        1.560000   0.000000   1.560000 (  1.576624)
String =~ /\A...\z/      1.600000   0.010000   1.610000 (  1.610818)

jruby 9.1.15.0 (2.3.3) 2017-12-07 929fde8 Java HotSpot(TM) 64-Bit Server VM 25.77-b03 on 1.8.0_77-b03 +jit [darwin-x86_64]
Rehearsal ----------------------------------------------------------
String#start_with        0.950000   0.030000   0.980000 (  0.336283)
String#start_with(all)   0.510000   0.010000   0.520000 (  0.227464)
String#end_with(all)     0.530000   0.010000   0.540000 (  0.226937)
String#end_with          0.450000   0.020000   0.470000 (  0.232159)
String =~ /\A.../        1.480000   0.060000   1.540000 (  0.850047)
String =~ /...\z/        0.920000   0.050000   0.970000 (  1.107115)
String =~ /\A...\z/      0.790000   0.020000   0.810000 (  0.622925)
------------------------------------------------- total: 5.830000sec

                             user     system      total        real
String#start_with        0.110000   0.000000   0.110000 (  0.106424)
String#start_with(all)   0.090000   0.010000   0.100000 (  0.084790)
String#end_with(all)     0.090000   0.000000   0.090000 (  0.099988)
String#end_with          0.130000   0.000000   0.130000 (  0.132520)
String =~ /\A.../        0.450000   0.020000   0.470000 (  0.522887)
String =~ /...\z/        0.490000   0.020000   0.510000 (  0.583060)
String =~ /\A...\z/      0.520000   0.020000   0.540000 (  0.545697)
