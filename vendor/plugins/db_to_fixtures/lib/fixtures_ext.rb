class Fixtures

  def self.create_fixtures(fixtures_directory, table_names, class_names = {})
    table_names = [table_names].flatten.map { |n| n.to_s }
    connection = block_given? ? yield : ActiveRecord::Base.connection
    ActiveRecord::Base.silence do
      fixtures_map = {}
      fixtures = table_names.map do |table_name|

				class_name = class_names[table_name.to_sym] || table_name.to_s.pluralize.classify
				kls = nil
				begin
					kls = class_name.constantize
				rescue NameError => e
					
				end
        conn = kls ? kls.connection : connection
        _table_name = kls ? kls.table_name : File.split(table_name.to_s).last
#        puts [table_name, _table_name].inspect
        fixtures_map[table_name] = Fixtures.new(conn, _table_name, class_name, File.join(fixtures_directory, table_name.to_s))
      end               
      all_loaded_fixtures.merge! fixtures_map  

      connection.transaction do
        fixtures.reverse.each { |fixture| fixture.delete_existing_fixtures }
        fixtures.each { |fixture| fixture.insert_fixtures }

        # Cap primary key sequences to max(pk).
        if connection.respond_to?(:reset_pk_sequence!)
          table_names.each do |table_name|
            connection.reset_pk_sequence!(table_name)
          end
        end
      end

      return fixtures.size > 1 ? fixtures : fixtures.first
    end
  end

end

class Fixture
	def key_list
	  kls = nil
		begin
			kls = @class_name.constantize
		rescue NameError => e
		end
		conn = kls ? kls.connection : ActiveRecord::Base.connection
	  columns = @fixture.keys.collect{ |column_name| conn.quote_column_name(column_name) }
	  columns.join(", ")
	end
end