module Referenceable
  module ClassMethods
    def all
      @all
    end

    def all=(all)
      @all = all
    end

    def count
      @count
    end

    def count=(count)
      @count = count
    end

    def find(id)
      id_inst = nil
      @all.each { |ref| id_inst = ref if id == ref.id }
      id_inst
    end

    def last_id
      @last_id
    end

    def last_id=(last_id)
      @last_id = last_id
    end

    def delete(id)
      del_inst = find(id)
      unless del_inst.nil?
        @all.delete(del_inst)
        @count -= 1
      end
      del_inst
    end
  end

  module InstanceMethods
    attr_reader :id
  end
end
