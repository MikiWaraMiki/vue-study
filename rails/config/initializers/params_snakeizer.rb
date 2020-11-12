module ActionController
  class Parameters
    def deep_snakeize!
      @parameters.deep_transform_keys!(&:underscore)
    end
  end
end
