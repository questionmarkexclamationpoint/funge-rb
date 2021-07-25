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
        # 00001 - t is implemented
        # 00010 - i is implemented
        # 00100 - o is implemented
        # 01000 - = is implemented
        # 00000 - unclear what last bit does? TODO
        0b01111
      end

      def cell_size
        # no effective limit; arbitrarily high number
        0b10000000000000000000000000000000
      end

      def handprint
        # at some point, the hash of 'funge-rb' in ruby
        3222222126255942236
      end

      def version
        version = 0
        Funge::VERSION.chars.each do |c|
          if ('0'..'9').include?(c)
            version *= 10
            version += c.to_i
          end
        end
        version
      end

      def operating_paradigm_id
        # uses ruby's #system, which uses the shell that started that ruby program
        3
      end

      def separator
        # Ruby will take a slash no matter what.
        '/'.ord
      end

      def vector_size(state)
        state.dimensions
      end

      def ip_id(ip)
        ip.id
      end

      def ip_team_id
        # teams not relevant
        0
      end

      def ip_pos(ip, state)
        v = []
        v.push(ip.pos.z) if state.dimensions >= 3
        v.push(ip.pos.y) if state.dimensions >= 2
        v.push(ip.pos.x)
        v
      end

      def ip_delta(ip, state)
        v = []
        v.push(ip.delta.z) if state.dimensions >= 3
        v.push(ip.delta.y) if state.dimensions >= 2
        v.push(ip.delta.x)
        v
      end

      def ip_storage_offset(ip, state)
        v = []
        v.push(ip.storage_offset.z) if state.dimensions >= 3
        v.push(ip.storage_offset.y) if state.dimensions >= 2
        v.push(ip.storage_offset.x)
        v
      end

      def greatest_point(state)

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