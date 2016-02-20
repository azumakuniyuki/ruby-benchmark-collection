require 'benchmark'

HowMany = 3000000
RegExp0 = %r/(?:mike|nora|kuro|shiro)neko\z/
NekoStr = 'shironeko'

puts 'ok' if NekoStr =~  RegExp0
puts 'ok' if RegExp0 === NekoStr

Benchmark.bmbm do |b|
  b1 = 0
  b.report('=~') do
    HowMany.times do
      b1 += 1 if NekoStr =~ RegExp0
    end
  end

  b2 = 0
  b.report('===') do
    HowMany.times do
      b2 += 1 if RegExp0 === NekoStr
    end
  end
end

__END__
ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin13]
Rehearsal ---------------------------------------
=~    1.640000   0.020000   1.660000 (  1.657197)
===   1.710000   0.020000   1.730000 (  1.731782)
------------------------------ total: 3.390000sec

          user     system      total        real
=~    1.670000   0.000000   1.670000 (  1.683938)
===   1.730000   0.020000   1.750000 (  1.741239)

jruby 9.0.5.0 (2.2.3) 2016-01-26 7bee00d Java HotSpot(TM) 64-Bit Server VM 24.45-b08 on 1.7.0_45-b18 +jit [darwin-x86_64]
Rehearsal ---------------------------------------
=~    3.020000   0.120000   3.140000 (  2.281194)
===   1.860000   0.050000   1.910000 (  1.726152)
------------------------------ total: 5.050000sec

          user     system      total        real
=~    1.610000   0.030000   1.640000 (  1.632948)
===   1.600000   0.030000   1.630000 (  1.617384)
