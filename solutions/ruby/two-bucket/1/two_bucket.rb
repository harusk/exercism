class TwoBucket
    # option is a string that receives either "one" or "two"
    def initialize(bucket_one, bucket_two, desired_liters, option)
      @bucket_one = [bucket_one, 0, "one"]
      @bucket_two = [bucket_two, 0, "two"]
      @desired_liters = desired_liters
      @option = option
    end

    def moves
      @number_actions = 0
      # First move is to fill the selected bucket
      case @option
        when "one"
          @initial_bucket = @bucket_one
          @other_bucket = @bucket_two
        when "two"
          @initial_bucket = @bucket_two
          @other_bucket = @bucket_one
      end
      @initial_bucket[1] += @initial_bucket[0]
      @number_actions += 1
      until @initial_bucket[1] == @desired_liters || @other_bucket[1] == @desired_liters
        # if the initial bucket is full or has more liters than the other
        if @initial_bucket[1] == @initial_bucket[0] || @initial_bucket[1] > @other_bucket[1]
          # Pours one bucket into the other until either ...
          # (..and if the other bucket is not full)
          if @other_bucket[1] < @other_bucket[0]
            # b) the second bucket is full
            if @other_bucket[0] != @desired_liters
                until @other_bucket[1] == @other_bucket[0]
                @other_bucket[1] += 1
                @initial_bucket[1] -= 1
                    # takes care the initial bucket doesnt become empty AND fills the other bucket
                    if @initial_bucket[1] == 0
                        break
                    end
                end
            else
                @other_bucket[1] = @other_bucket[0]
                @number_actions += 1
                break
            end
            # this counts as a single action and moves on to the next iteration
            @number_actions += 1
            next
          # if the other bucket is full and we wanted to pour one into other...
          elsif @other_bucket[1] == @other_bucket[0]
            # empty the bucket, does not pour, counts action and moves to next iteration
            @other_bucket[1] = 0
            @number_actions += 1
            next
          end
          # if initial bucket is empty and the other isnt full
        elsif @initial_bucket[1] == 0 && ( @other_bucket[1] > 0 && @other_bucket[1] < @other_bucket[0] )
            # fills initial bucket, does nothing to the other
            until @initial_bucket[1] == @initial_bucket[0]
                @initial_bucket[1] += 1
            end
            @number_actions += 1
            next
        # if other bucket is full but the other has content but not filled
        elsif @other_bucket[1] == @other_bucket[0] && @initial_bucket[1] < @other_bucket[1]
            @other_bucket[1] = 0
            @number_actions += 1
            next
        end
       end
       @number_actions
    end

    def goal_bucket
        if @initial_bucket[1] == @desired_liters
            @initial_bucket[2]
        elsif @other_bucket[1] == @desired_liters
            @other_bucket[2]
        end
    end

    def other_bucket
       # it refers as "other bucket" to the bucket that wasn't the goal bucket
        if @initial_bucket[1] == @desired_liters
            @other_bucket[1]
        elsif @other_bucket[1] == @desired_liters
            @initial_bucket[1]
        end
    end
end
