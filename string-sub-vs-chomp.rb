require 'benchmark'

HowMany = 900000
Nyaaaan = 'NekoNyaan__END__'

v1 = Nyaaaan.dup; v1 = v1.sub(/__END__\z/, ''); puts 'ok' if v1 == 'NekoNyaan'
v2 = Nyaaaan.dup; v2 = v2.chomp('__END__'); puts 'ok' if v2 == 'NekoNyaan'

Benchmark.bmbm do |b|
  b.report('String#sub(/...\z/)') do
    HowMany.times do
      v = Nyaaaan.dup
      v = v.sub(/__END__\z/, '')
    end
  end

  b.report('String#chomp("...")') do
    HowMany.times do
      v = Nyaaaan.dup
      v = v.chomp('__END__')
    end
  end
end

__END__
ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
ok
ok
Rehearsal -------------------------------------------------------
String#sub(/...\z/)   2.700000   0.010000   2.710000 (  2.743732)
String#chomp("...")   1.820000   0.030000   1.850000 (  2.115522)
---------------------------------------------- total: 4.560000sec

                          user     system      total        real
String#sub(/...\z/)   2.840000   0.040000   2.880000 (  2.970872)
String#chomp("...")   1.620000   0.000000   1.620000 (  1.634281)
ruby $B  9.10s user 0.10s system 95% cpu 9.612 total

jruby 9.1.15.0 (2.3.3) 2017-12-07 929fde8 Java HotSpot(TM) 64-Bit Server VM 25.77-b03 on 1.8.0_77-b03 +jit [darwin-x86_64]
ok
ok
Rehearsal -------------------------------------------------------
String#sub(/...\z/)   3.670000   0.110000   3.780000 (  1.574862)
String#chomp("...")   0.490000   0.020000   0.510000 (  0.256289)
---------------------------------------------- total: 4.290000sec

                          user     system      total        real
String#sub(/...\z/)   0.830000   0.030000   0.860000 (  0.738167)
String#chomp("...")   0.150000   0.020000   0.170000 (  0.178568)
