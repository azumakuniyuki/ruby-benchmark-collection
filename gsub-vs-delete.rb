require 'benchmark'

HowMany = 1000000
String0 = '	neko'
String1 = '	neko'

puts 'ok' if String0.gsub(/\t/, '') == 'neko'
puts 'ok' if String1.delete("\t")   == 'neko'

Benchmark.bmbm do |b|
  b1 = 0
  b.report('gsub') do
    HowMany.times do
      b1 += 1 if String0.gsub(/\t/, '') == 'neko'
    end
  end

  b2 = 0
  b.report('delete') do
    HowMany.times do
      b2 += 1 if String1.delete("\t") == 'neko'
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
ruby gsub-vs-delete.rb  8.81s user 0.09s system 99% cpu 8.912 total
