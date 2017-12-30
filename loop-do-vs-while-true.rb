require 'benchmark'

HowMany = 1000000

Benchmark.bmbm do |b|
  b.report('loop-do') do
    ld = 0
    HowMany.times do
      catch :LOOPDO do
        loop do
          ld += 1
          throw :LOOPDO
        end
      end
    end
  end

  b.report('while-true') do
    wt = 0
    HowMany.times do
      catch :WHILE1 do
        while true
          wt += 1
          throw :WHILE1
        end
      end
    end
  end
end

__END__

