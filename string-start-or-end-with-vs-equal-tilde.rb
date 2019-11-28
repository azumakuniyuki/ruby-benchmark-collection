require 'benchmark'

HowMany = 1600000
Nyaaaan = 'NekoNyaan'

puts 'ok' if Nyaaaan.start_with?('Neko')
puts 'ok' if Nyaaaan.end_with?('Nyaan')
puts 'ok' if Nyaaaan.start_with?('NekoNyaan')
puts 'ok' if Nyaaaan.end_with?('NekoNyaan')
puts 'ok' if Nyaaaan.start_with?('Neko', 'Cat')
puts 'ok' if Nyaaaan.end_with?('Nyaan', 'Cat')
puts 'ok' if Nyaaaan =~ /\ANeko/
puts 'ok' if Nyaaaan =~ /Nyaan\z/
puts 'ok' if Nyaaaan =~ /\ANekoNyaan\z/
puts 'ok' if Nyaaaan =~ /\A(?:Nyaan|Cat)\z/
puts 'ok' if Nyaaaan == 'NekoNyaan'

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

  b.report('String#start_with(1,2)') do
    HowMany.times do
      Nyaaaan.start_with?('Cat', 'Neko')
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

  b.report('String#end_with(1,2)') do
    HowMany.times do
      Nyaaaan.end_with?('Cat', 'Nyaan')
    end
  end

  b.report('String =~ /\A.../') do
    HowMany.times do
      Nyaaaan =~ /\ANeko/
    end
  end

  b.report('String =~ /\A(.|.)/') do
    HowMany.times do
      Nyaaaan =~ /\A(?:Cat|Neko)/
    end
  end

  b.report('String =~ /...\z/') do
    HowMany.times do
      Nyaaaan =~ /Nyaan\z/
    end
  end

  b.report('String =~ /(.|.)\z/') do
    HowMany.times do
      Nyaaaan =~ /(?:Cat|Nyaan)\z/
    end
  end

  b.report('String =~ /\A...\z/') do
    HowMany.times do
      Nyaaaan =~ /\ANekoNyaan\z/
    end
  end
  
  b.report('String =~ /\A(.|.)\z/') do
    HowMany.times do
      Nyaaaan =~ /\A(?:Cat|NekoNyaan)\z/
    end
  end

  b.report('String == NekoNyaan') do
    HowMany.times do
      Nyaaaan == 'NekoNyaan'
    end
  end
end

__END__
ruby 2.6.4p104 (2019-08-28 revision 67798) [x86_64-darwin18]
                             user     system      total        real
String#start_with        0.150174   0.001813   0.151987 (  0.154173)
String#start_with(all)   0.150251   0.000323   0.150574 (  0.151076)
String#start_with(1,2)   0.218610   0.000563   0.219173 (  0.220152)
String#end_with(all)     0.155070   0.001716   0.156786 (  0.158870)
String#end_with          0.156511   0.000501   0.157012 (  0.157591)
String#end_with(1,2)     0.223731   0.000415   0.224146 (  0.224584)
String =~ /\A.../        0.307362   0.001887   0.309249 (  0.311604)
String =~ /\A(.|.)/      0.308847   0.002052   0.310899 (  0.313380)
String =~ /...\z/        0.321915   0.000741   0.322656 (  0.323630)
String =~ /(.|.)\z/      0.326292   0.001991   0.328283 (  0.330726)
String =~ /\A...\z/      0.321877   0.001998   0.323875 (  0.326309)
String =~ /\A(.|.)\z/    0.320255   0.000843   0.321098 (  0.321940)
String == NekoNyaan      0.126435   0.001887   0.128322 (  0.130629)

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
