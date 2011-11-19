class Hash
    # Flatten a hash into a flat form suitable for an URL.
    # Accepts as an optional parameter an array of names that pretend to be the ancestor key names.
    #
    # Example 1:
    #
    #   { 'animals' => {
    #       'fish' => { 'legs' => 0, 'sound' => 'Blub' }
    #       'cat' => { 'legs' => 4, 'sound' => 'Miaow' }
    #   }.flatten_for_url
    #
    #   # => { 'animals[fish][legs]'  => 0,
    #          'animals[fish][sound]' => 'Blub',
    #          'animals[cat][legs]'   => 4,
    #          'animals[cat][sound]'  => 'Miaow'
    #        }
    #
    # Example 2:
    #
    #   {'color' => 'blue'}.flatten_for_url( %w(world things) )  # => {'world[things][color]' => 'blue'}
    #
    def flatten_for_url(ancestor_names = [])
      flat_hash = Hash.new

      each do |key, value|
        names = Array.new(ancestor_names)
        names << key

        if value.is_a?(Hash)
          flat_hash.merge!(value.flatten_for_url(names))
        else
          flat_key = names.shift.to_s.dup
          names.each do |name|
            flat_key << "[#{name}]"
          end
          flat_key << "[]" if value.is_a?(Array)
          flat_hash[flat_key] = value
        end
      end

      flat_hash
    end
  end