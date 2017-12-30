require 'benchmark'

HowMany = 500000
string0 = '>>neko'
string1 = '>>neko'
string2 = '>>neko'

puts 'ok' if string0.gsub('>', '') == 'neko'
puts 'ok' if string1.delete('>')   == 'neko'
puts 'ok' if string2.tr('>', '')   == 'neko'

Benchmark.bmbm do |b|
  b.report('String#gsub') do
    v = 0
    HowMany.times do
      v += 1 if string0.gsub('>', '') == 'neko'
    end
  end

  b.report('String#delete') do
    v = 0
    HowMany.times do
      v += 1 if string1.delete('>') == 'neko'
    end
  end

  b.report('String#tr') do
    v = 0
    HowMany.times do
      v += 1 if string2.tr('>', '') == 'neko'
    end
  end
end

__END__
ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin13]
Rehearsal ------------------------------------------
gsub     3.420000   0.040000   3.460000 (  3.466128)
delete   0.950000   0.000000   0.950000 (  0.946812)
--------------------------------- total: 4.410000sec

             user     system      total        real
gsub     3.450000   0.040000   3.490000 (  3.488994)
delete   0.940000   0.010000   0.950000 (  0.947218)

ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-darwin16]
ok
ok
ok
Rehearsal -------------------------------------------------
String#gsub     1.910000   0.000000   1.910000 (  1.931240)
String#delete   1.730000   0.010000   1.740000 (  1.740480)
String#tr       1.830000   0.010000   1.840000 (  1.849099)
---------------------------------------- total: 5.490000sec

                    user     system      total        real
String#gsub     1.930000   0.000000   1.930000 (  1.937831)
String#delete   1.740000   0.010000   1.750000 (  1.743997)
String#tr       1.870000   0.000000   1.870000 (  1.885453)
