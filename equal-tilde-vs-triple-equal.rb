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
=~    0.550000   0.010000   0.560000 (  0.556420)
===   0.540000   0.020000   0.560000 (  0.555823)
------------------------------ total: 1.120000sec

          user     system      total        real
=~    0.550000   0.000000   0.550000 (  0.544957)
===   0.550000   0.000000   0.550000 (  0.553498)

jruby 9.0.5.0 (2.2.3) 2016-01-26 7bee00d Java HotSpot(TM) 64-Bit Server VM 24.45-b08 on 1.7.0_45-b18 +jit [darwin-x86_64]
