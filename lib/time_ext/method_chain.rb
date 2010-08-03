module TimeExt
  # Allows iterators' #until and #from methods to chain back to the parent iteration method.
  module MethodChain
    
    def add_to_chain(method, *args, &block)
      @method_chain ||= []
      @method_chain << [method.to_sym, args, block]
    end
    
    def call_chain(custom_block = nil, &block)
      method, args, iblock = @method_chain.pop
      return nil if method.nil?
      iblock = custom_block if !custom_block.nil?
      method, args, iblock = yield(method, args, iblock) if block_given?
      self.send(method, *args, &iblock)
    end
    
  end
end