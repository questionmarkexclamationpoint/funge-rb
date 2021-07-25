module Funge
  module Instruction
    class GetSysInfo < Base
      CHARACTERS = 'y'.freeze

      # @param ip [InstructionPointer]
      # @param state [State]
      def execute(ip, state)
        sysinfo = [
          env,
          args,
          ip_stack_sizes(ip),
          ip_stack_stack_size(ip),
          time,
          date,
          ip_greatest_point(ip),
          ip_storage_offset(ip),
          ip_delta(ip),
          ip_pos(ip),
          ip_team_id(ip),
          ip_id(ip),
          vector_size,
          separator,
          operating_paradigm_id,
          version,
          handprint,
          cell_size,
          flags
        ].flatten
        arg = ip.toss.pop
        sysinfo.each do |cell|
          ip.toss << cell
        end
        if arg > 0
          if arg > ip.toss.size
            ip.toss<< 0
          else
            arg = -arg - 1
            ip.toss << ip.toss[arg]
          end
        end
      end

      private

      def flags
        # 0001 - t is implemented
        # 0010 - i is implemented
        # 0100 - o is implemented
        # 1000 - = is implemented
        0b1111
      end

      def cell_size
        # no effective limit; arbitrarily high number
        0b10000000000000000000000000000000
      end

      def handprint
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def version
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def operating_paradigm_id
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def separator
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def vector_size
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def ip_id(ip)
        ip.id
      end

      def ip_team_id(ip)
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def ip_pos(ip)
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def ip_delta(ip)
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def ip_storage_offset(ip)
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def ip_greatest_point(ip)
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def date
        time = Time.now
        ((time.year - 1900) * 256 * 256) + (time.month * 256) + time.day
      end

      def time
        time = Time.now
        (time.hour * 256 * 256) + (time.minute * 256) + time.sec
      end

      def ip_stack_stack_size(ip)
        ip.stack_stack.size
      end

      def ip_stack_sizes(ip)
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def args
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end

      def env
        raise NotImplementedError.new("#{GetSysInfo} is not implemented") # TODO
      end
    end
  end
end