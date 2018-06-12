class EventRecord
	@@date_event = {}
	@@e_name=[]
	def add_event_details(name,date)
		date = date.split("-")
		d = date[2]
		date = date[0] + "-" + date[1]
		@@e_name << name
		if @@date_event.has_key? (date)
			@@date_event[date].push([name,d])
		else
			@@date_event[date] = Array.new
			@@date_event[date].push([name,d])
		end
	end
	
	def self.return_all_events
		if @@e_name.length == 0
			puts "No event added yet"
		else
			@@e_name.each.with_index(1) do |n,idx|
				puts "#{idx}: #{n}"
		end
		end
	end
	
	def self.add_event
		EventRecord.new
	end
	
	def self.events_for_given_month
		if @@e_name.length == 0
			puts "No event added yet"
		else
			print "Enter the required year\n"
			y = gets.chomp
			print "Enter the required month\n"
			m = gets.chomp
			if [1,3,5,7,8,10,12].include?(m.to_i)
				range = (1..31)
			elsif [4,6,9,11].include?(m.to_i)
				range = (1..30)
			else
				range = (1..28)
			end
			tmp = Hash.new{|h,k| h[k] = [] }
			
			if @@date_event.has_key? (y+"-"+m)
				@@date_event[y+"-"+m].each do |n|
					tmp[n[1].to_i] << n[0]
				end
				tmp = tmp.sort.to_h
				range.each do |x|
					if tmp.has_key? (x)
						print "Date #{x}: Event Scheduled: #{tmp[x]}\n"
					else
						print "Date #{x}: \n"
					end
				end
			else
				puts "No Events Found"
			end
		end
	end
	
	def self.delete_event
		if @@e_name.length == 0
			puts "No event added yet"
		else
			print  "Enter name of the Event to delete \n"
			name = gets.chomp
			print  "Enter date of the Event to delete (yy:mm:dd)\n"
			date = gets.chomp
			t = date.split("-")
			year = t[0]
			month = t[1]
			date=t[2]
			flag = 0	
			temp = @@date_event[year+"-"+month]
			for i in (0...temp.length)
				if temp[i][1] == date
					temp[i..i]=[]
					@@e_name[@@e_name.index(name)..@@e_name.index(name)]=[]
					@@date_event[year+"-"+month] = temp
					flag = 1
					puts "Event Deleted"
					break
				end
			end

			if flag == 0
				puts "Event not found"
			end
		end
	end
end